# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hypercorn/"
SRC_URI="
	https://github.com/pgjones/hypercorn/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs h3 trio"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	h3? ( <dev-python/aioquic-1.0[${PYTHON_USEDEP}] )
	dev-python/h11[${PYTHON_USEDEP}]
	>=dev-python/h2-3.1.0[${PYTHON_USEDEP}]
	dev-python/priority[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-mermaid[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.22.0[${PYTHON_USEDEP}] )
	>=dev-python/wsproto-0.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/h11[${PYTHON_USEDEP}]
	>=dev-python/h2-3.1.0[${PYTHON_USEDEP}]
	dev-python/priority[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/exceptiongroup-1.1.0[${PYTHON_USEDEP}]
		dev-python/taskgroup[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10)
	>=dev-python/wsproto-0.14.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-trio[${PYTHON_USEDEP}]
		>=dev-python/trio-0.22.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e 's:--no-cov-on-fail::' pyproject.toml || die
	distutils-r1_src_prepare
}
