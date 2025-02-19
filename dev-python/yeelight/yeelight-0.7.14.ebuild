# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1 pypi

DESCRIPTION="A Python library for controlling YeeLight RGB bulbs."
HOMEPAGE="
  https://pypi.org/project/yeelight/
  Homepage, https://gitlab.com/stavros/python-yeelight
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx ; extra == 'dev'
	async-timeout; python_version<'3.11'
	flake8 ; extra == 'dev'
	flake8-docstrings ; extra == 'dev'
	flake8-import-order ; extra == 'dev'
	flake8-tidy-imports ; extra == 'dev'
	future
	ifaddr
	importlib_metadata; python_version<'3.8'
	pep8-naming ; extra == 'dev'
	sphinx-rtd-theme ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/ifaddr[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flake8-docstrings[${PYTHON_USEDEP}]
		dev-python/flake8-import-order[${PYTHON_USEDEP}]
		dev-python/flake8-tidy-imports[${PYTHON_USEDEP}]
		dev-python/pep8-naming[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
	yeelight/tests.py || die
}

distutils_enable_tests pytest
