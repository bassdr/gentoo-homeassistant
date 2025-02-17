# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipyparallel/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="benchmark labextension nbext retroextension serverextension"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	asv; extra == 'benchmark'
	decorator
	importlib-metadata>=3.6; python_version < '3.10'
	ipykernel>=6.9.1
	ipython>=5
	ipython[test]; extra == 'test'
	jupyter-client>=7
	jupyter-server; extra == 'labextension'
	jupyter-server; extra == 'nbext'
	jupyter-server; extra == 'retroextension'
	jupyter-server; extra == 'serverextension'
	jupyterlab>=3; extra == 'labextension'
	notebook; extra == 'nbext'
	psutil
	pytest-asyncio; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	python-dateutil>=2.1
	pyzmq>=25
	retrolab; extra == 'retroextension'
	testpath; extra == 'test'
	tornado>=6.1
	tqdm
	traitlets>=5
"
GENERATED_RDEPEND="${RDEPEND}
	benchmark? ( dev-python/asv[${PYTHON_USEDEP}] )
	dev-python/decorator[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.9.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-5[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7[${PYTHON_USEDEP}]
	labextension? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	nbext? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	retroextension? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	serverextension? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	labextension? ( >=dev-python/jupyterlab-3[${PYTHON_USEDEP}] )
	nbext? ( dev-python/notebook[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-25[${PYTHON_USEDEP}]
	retroextension? ( dev-python/retrolab[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.1[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-25[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5[${PYTHON_USEDEP}]
	>=dev-python/ipython-5[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7[${PYTHON_USEDEP}]
	dev-python/jupyter-server[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.9.1[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/flit-core[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-tornado[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"

# TODO: package myst_parser
# distutils_enable_sphinx docs/source
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/ipython[test,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_configure() {
	export IPP_DISABLE_JS=1
}

python_test() {
	local EPYTEST_DESELECT=(
		# we don't run a mongo instance for tests
		ipyparallel/tests/test_mongodb.py::TestMongoBackend
		# TODO
		ipyparallel/tests/test_util.py::test_disambiguate_ip
		# Gets upset that a timeout _doesn't_ occur, presumably because
		# we're cranking up too many test timeouts. Oh well.
		# bug #823458#c3
		ipyparallel/tests/test_asyncresult.py::AsyncResultTest::test_wait_for_send
		# We could patch the timeout for these too but they're going to be inherently
		# fragile anyway based on what they do.
		ipyparallel/tests/test_client.py::TestClient::test_activate
		ipyparallel/tests/test_client.py::TestClient::test_lazy_all_targets
		ipyparallel/tests/test_client.py::TestClient::test_wait_for_engines
	)
	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# pure Python datetime incompatibility?  TODO
				ipyparallel/tests/test_asyncresult.py::TestAsyncResult::test_elapsed_multi
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p tornado
}

python_install_all() {
	distutils-r1_python_install_all
	# move /usr/etc stuff to /etc
	mv "${ED}/usr/etc" "${ED}/etc" || die
}

pkg_postinst() {
	optfeature "Jupyter Notebook integration" dev-python/notebook
}
