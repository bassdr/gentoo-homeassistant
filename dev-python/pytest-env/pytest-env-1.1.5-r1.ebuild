# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-env/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	testing? ( >=dev-python/covdefaults-2.3[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/coverage-7.6.1[${PYTHON_USEDEP}] )
	>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	>=dev-python/hatch-vcs-0.3[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# upstream lower bounds are meaningless
	sed -i -e 's:>=[0-9.]*::' pyproject.toml || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
