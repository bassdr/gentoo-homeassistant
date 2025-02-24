# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="ssl(+)"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-libcloud/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="publish test"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	build (==0.10.0) ; extra == 'build'
	pytest ; extra == 'test'
	requests (>=2.26.0)
	requests-mock ; extra == 'test'
	twine (==4.0.2) ; extra == 'publish'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
	publish? ( ~dev-python/twine-4.0.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	~dev-python/build-0.10.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	local PATCHES=(
		# https://github.com/apache/libcloud/pull/2014
		"${FILESDIR}/${P}-pytest-8.2.patch"
	)

	distutils-r1_src_prepare

	if use examples; then
		mkdir examples || die
		mv example_*.py examples || die
	fi

	# needed for tests
	cp libcloud/test/secrets.py-dist libcloud/test/secrets.py || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		libcloud/test/test_init.py::TestUtils::test_init_once_and_debug_mode
	)

	local -x NO_INTERNET=1
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

src_install() {
	use examples && dodoc -r examples
	distutils-r1_src_install
}
