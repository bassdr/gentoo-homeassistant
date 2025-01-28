# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-server-proxy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# Connection refused, even without network-sandbox
RESTRICT="test"

GENERATED_IUSE="acceptance classic lab test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-1.24.0[${PYTHON_USEDEP}]
	classic? ( <dev-python/jupyter-server-2[${PYTHON_USEDEP}] )
	lab? ( >=dev-python/jupyter-server-2[${PYTHON_USEDEP}] )
	classic? ( <dev-python/jupyterlab-4.0.0_alpha0[${PYTHON_USEDEP}] )
	lab? ( <dev-python/jupyterlab-5.0.0_alpha0[${PYTHON_USEDEP}] )
	lab? ( dev-python/nbclassic[${PYTHON_USEDEP}] )
	classic? ( <dev-python/notebook-7.0.0_alpha0[${PYTHON_USEDEP}] )
	lab? ( >=dev-python/notebook-7[${PYTHON_USEDEP}] )
	acceptance? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	acceptance? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	acceptance? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	acceptance? ( dev-python/pytest-html[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-html[${PYTHON_USEDEP}] )
	acceptance? ( >=dev-python/robotframework-jupyterlibrary-0.4.2[${PYTHON_USEDEP}] )
	>=dev-python/simpervisor-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/simpervisor-1.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatch-jupyter-builder-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-4.0.6[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	sed \
		-e "/--cov.*,/d" \
		-e "/--no-cov.*,/d" \
		-e "/--html.*,/d" \
		-i pyproject.toml || die
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install
	mv "${ED}/usr/etc" "${ED}/etc" || die
}
