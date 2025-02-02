# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="\"Low-level communication layer for PRAW 4+."
HOMEPAGE="
  https://pypi.org/project/prawcore/
  Issue Tracker, https://github.com/praw-dev/prawcore/issues
  Source Code, https://github.com/praw-dev/prawcore
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="ci lint"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	ci? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.6.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/ruff-0.0.291[${PYTHON_USEDEP}] )
	lint? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/betamax-0.8[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/prawcore[lint,${PYTHON_USEDEP}]
	dev-python/prawcore[test,${PYTHON_USEDEP}]
	>=dev-python/pytest-2.7.3[${PYTHON_USEDEP}]
	~dev-python/urllib3-1.26[${PYTHON_USEDEP}]
)"
