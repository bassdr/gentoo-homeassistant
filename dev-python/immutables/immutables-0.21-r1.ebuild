# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/immutables/"
SRC_URI="
	https://github.com/MagicStack/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/flake8-5.0[${PYTHON_USEDEP}] =dev-python/flake8-5*[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.4[${PYTHON_USEDEP}] =dev-python/mypy-1*[${PYTHON_USEDEP}]
		>=dev-python/pycodestyle-2.9[${PYTHON_USEDEP}] =dev-python/pycodestyle-2*[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.4[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	sed -i -e '/mypy/d' tests/conftest.py || die
	distutils-r1_src_prepare
}

python_compile() {
	# upstream controls NDEBUG explicitly
	use debug && local -x DEBUG_IMMUTABLES=1
	local -x IMMUTABLES_EXT=$(usex native-extensions 1 0)

	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_IGNORE=(
		tests/test_mypy.py
	)

	rm -rf immutables || die
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
