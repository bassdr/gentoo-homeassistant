# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi xdg-utils

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/notebook/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	hatch; extra == 'dev'
	importlib-resources>=5.0; python_version < '3.10' and extra == 'test'
	ipykernel; extra == 'test'
	jupyter-server<3,>=2.4.0
	jupyter-server[test]<3,>=2.4.0; extra == 'test'
	jupyterlab-server<3,>=2.27.1
	jupyterlab-server[test]<3,>=2.27.1; extra == 'test'
	jupyterlab<4.4,>=4.3.4
	myst-parser; extra == 'docs'
	nbsphinx; extra == 'docs'
	nbval; extra == 'test'
	notebook-shim<0.3,>=0.2
	pre-commit; extra == 'dev'
	pydata-sphinx-theme; extra == 'docs'
	pytest-console-scripts; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest-tornasync; extra == 'test'
	pytest>=7.0; extra == 'test'
	requests; extra == 'test'
	sphinx>=1.3.6; extra == 'docs'
	sphinxcontrib-github-alt; extra == 'docs'
	sphinxcontrib-spelling; extra == 'docs'
	tornado>=6.2.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jupyter-server-2.4.0[${PYTHON_USEDEP}] <dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-4.3.4[${PYTHON_USEDEP}] <dev-python/jupyterlab-4.4[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-server-2.27.1[${PYTHON_USEDEP}] <dev-python/jupyterlab-server-3[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	>=dev-python/notebook-shim-0.2[${PYTHON_USEDEP}] <dev-python/notebook-shim-0.3[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.3.6[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jupyter-server-2.4.0[${PYTHON_USEDEP}]
	<dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-4.3.4[${PYTHON_USEDEP}]
	<dev-python/jupyterlab-4.4[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-server-2.27.1[${PYTHON_USEDEP}]
	<dev-python/jupyterlab-server-3[${PYTHON_USEDEP}]
	>=dev-python/notebook-shim-0.2[${PYTHON_USEDEP}]
	<dev-python/notebook-shim-0.3[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatch-jupyter-builder[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-4.3.4[${PYTHON_USEDEP}]
	<dev-python/jupyterlab-4.4[${PYTHON_USEDEP}]
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/nbval[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-unixsocket[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/hatch[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		>=dev-python/jupyter-server-2.4.0[test,${PYTHON_USEDEP}] <dev-python/jupyter-server-3[test,${PYTHON_USEDEP}]
		>=dev-python/jupyterlab-server-2.27.1[test,${PYTHON_USEDEP}] <dev-python/jupyterlab-server-3[test,${PYTHON_USEDEP}]
		dev-python/nbval[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_install_all() {
	distutils-r1_python_install_all
	mv "${ED}/usr/etc" "${ED}/etc" || die
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
