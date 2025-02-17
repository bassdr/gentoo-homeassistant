# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-subprocess/"
SRC_URI="
	https://github.com/aklajnert/pytest-subprocess/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Pygments>=2.0; extra == 'test'
	anyio; extra == 'test'
	changelogd; extra == 'dev'
	changelogd; extra == 'docs'
	docutils>=0.12; extra == 'test'
	furo; extra == 'docs'
	nox; extra == 'dev'
	pytest-asyncio>=0.15.1; extra == 'test'
	pytest-rerunfailures; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest>=4.0.0
	pytest>=4.0; extra == 'test'
	sphinx-autodoc-typehints; extra == 'docs'
	sphinx; extra == 'docs'
	sphinxcontrib-napoleon; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/changelogd[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/pytest-4.0.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-napoleon[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/anyio[${PYTHON_USEDEP}]
		>=dev-python/docutils-0.12[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.15.1[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/anyio[${PYTHON_USEDEP}]
		dev-python/changelogd[${PYTHON_USEDEP}]
		>=dev-python/docutils-0.12[${PYTHON_USEDEP}]
		dev-python/nox[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.15.1[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_subprocess.fixtures,pytest_asyncio.plugin
	epytest -p rerunfailures
}
