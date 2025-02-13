# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=jupyter

inherit distutils-r1 pypi xdg-utils
SRC_URI="$(pypi_sdist_url ${PN} 0.2.0)"
S="${WORKDIR}/${PN}-0.2.0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbclassic/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	~dev-python/jupyter-server-1.0.1[${PYTHON_USEDEP}]
	<dev-python/notebook-7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/ipython-genutils[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio-1.5[${PYTHON_USEDEP}]
	>=dev-python/notebook-shim-0.2.3[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/nbval[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-unixsocket[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
	doc? (
		virtual/pandoc
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
	dev-python/pytest-tornasync[${PYTHON_USEDEP}]
)"
distutils_enable_sphinx docs/source \
	dev-python/pydata-sphinx-theme \
	dev-python/nbsphinx \
	dev-python/sphinxcontrib-github-alt \
	dev-python/myst-parser \
	dev-python/ipython-genutils

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

	# Notebook interferes with our tests, pretend it does not exist
	echo "raise ImportError" > notebook.py || die

	epytest -p pytest_tornasync.plugin
}

python_install_all() {
	distutils-r1_python_install_all
	# move /usr/etc stuff to /etc
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
