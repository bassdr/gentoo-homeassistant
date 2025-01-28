# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PRAW, an acronym for \`Python Reddit API Wrapper\`, is a python package that allows for simple access to reddit's API."
HOMEPAGE="
  https://pypi.org/project/praw/
  Change Log, https://praw.readthedocs.io/en/latest/package_info/change_log.html
  Documentation, https://praw.readthedocs.io/
  Issue Tracker, https://github.com/praw-dev/praw/issues
  Source Code, https://github.com/praw-dev/praw
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="ci dev lint readthedocs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev? ( <dev-python/betamax-0.9[${PYTHON_USEDEP}] )
	test? ( <dev-python/betamax-0.9[${PYTHON_USEDEP}] )
	dev? ( <dev-python/betamax-matchers-0.5[${PYTHON_USEDEP}] )
	test? ( <dev-python/betamax-matchers-0.5[${PYTHON_USEDEP}] )
	ci? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	dev? ( dev-python/packaging[${PYTHON_USEDEP}] )
	<dev-python/prawcore-3[${PYTHON_USEDEP}]
	dev-python/prawcore[${PYTHON_USEDEP}]
	dev? ( >=dev-python/pytest-2.7.3[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-2.7.3[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	lint? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	lint? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/update-checker-0.18[${PYTHON_USEDEP}]
	dev-python/update-checker[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	lint? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/prawcore-2.1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
