# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/quart-trio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	exceptiongroup>=1.1.0; python_version < '3.11'
	hypercorn[trio]>=0.12.0
	pydata_sphinx_theme; extra == 'docs'
	quart>=0.19
	trio>=0.19.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/hypercorn-0.12.0[trio,${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/quart-0.19[${PYTHON_USEDEP}]
	>=dev-python/trio-0.19.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		>=dev-python/exceptiongroup-1.1.0[${PYTHON_USEDEP}]
	' 3.10)
	>=dev-python/hypercorn-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/quart-0.19[${PYTHON_USEDEP}]
	>=dev-python/trio-0.19.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-trio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p trio
}
