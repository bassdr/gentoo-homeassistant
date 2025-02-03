# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-client/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	!=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-23.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.2[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jupyter-core-5.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-23.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.0[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib-metadata-4.8.3[${PYTHON_USEDEP}]
	' 3.{8,9})
"
BDEPEND="
	test? (
		>=dev-python/ipykernel-6.14[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.18[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.4.1[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/ipykernel-6.14[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		<dev-python/pytest-8.2.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.4.1[client,${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# TODO: times out
		tests/test_client.py::TestAsyncKernelClient::test_input_request
		# TODO
		tests/test_multikernelmanager.py::TestKernelManager::test_tcp_cinfo
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o tmp_path_retention_policy=all \
		-p asyncio -p rerunfailures --reruns=3 -p timeout
}
