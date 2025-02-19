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
GENERATED_IUSE="ci lint readthedocs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	betamax (<0.9,>=0.8) ; extra == 'dev'
	betamax (<0.9,>=0.8) ; extra == 'test'
	betamax-matchers (<0.5,>=0.3.0) ; extra == 'dev'
	betamax-matchers (<0.5,>=0.3.0) ; extra == 'test'
	coveralls ; extra == 'ci'
	packaging ; extra == 'dev'
	prawcore (<3,>=2.1)
	pre-commit ; extra == 'dev'
	pre-commit ; extra == 'lint'
	pytest (>=2.7.3) ; extra == 'dev'
	pytest (>=2.7.3) ; extra == 'test'
	sphinx ; extra == 'dev'
	sphinx ; extra == 'lint'
	sphinx ; extra == 'readthedocs'
	sphinx-rtd-theme ; extra == 'dev'
	sphinx-rtd-theme ; extra == 'lint'
	sphinx-rtd-theme ; extra == 'readthedocs'
	update-checker (>=0.18)
	websocket-client (>=0.54.0)
"
GENERATED_RDEPEND="${RDEPEND}
	ci? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	>=dev-python/prawcore-2.1[${PYTHON_USEDEP}] <dev-python/prawcore-3[${PYTHON_USEDEP}]
	lint? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	lint? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/update-checker-0.18[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
	lint? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/prawcore-2.1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/betamax-0.8[${PYTHON_USEDEP}] <dev-python/betamax-0.9[${PYTHON_USEDEP}]
		>=dev-python/betamax-matchers-0.3.0[${PYTHON_USEDEP}] <dev-python/betamax-matchers-0.5[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.7.3[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
