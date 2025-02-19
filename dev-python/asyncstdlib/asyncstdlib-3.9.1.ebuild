# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="The missing async toolbox"
HOMEPAGE="
  https://pypi.org/project/asyncstdlib/
  Documentation, https://asyncstdlib.readthedocs.io/en/latest/
  Source, https://github.com/maxfischer2781/asyncstdlib
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	black ; extra == 'test' and ( implementation_name=='cpython')
	flake8 ; extra == 'test'
	flake8-bugbear ; extra == 'test'
	pytest >=4.3.0 ; extra == 'test'
	sphinx ; extra == 'doc'
	sphinxcontrib-contentui ; extra == 'doc'
	sphinxcontrib-trio ; extra == 'doc'
	typing_extensions
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-contentui[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-trio[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flake8-bugbear[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.3.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
