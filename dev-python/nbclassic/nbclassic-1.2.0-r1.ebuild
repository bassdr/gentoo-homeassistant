# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=jupyter

inherit distutils-r1 pypi xdg-utils

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbclassic/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs json-logging"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage; extra == 'test'
	ipykernel
	ipython-genutils
	json-logging; extra == 'json-logging'
	myst-parser; extra == 'docs'
	nbsphinx; extra == 'docs'
	nbval; extra == 'test'
	nest-asyncio>=1.5
	notebook-shim>=0.2.3
	pytest-cov; extra == 'test'
	pytest-jupyter; extra == 'test'
	pytest-playwright; extra == 'test'
	pytest-tornasync; extra == 'test'
	pytest; extra == 'test'
	requests-unixsocket; sys_platform != 'win32' and extra == 'test'
	requests; extra == 'test'
	sphinx-rtd-theme; extra == 'docs'
	sphinx; extra == 'docs'
	sphinxcontrib-github-alt; extra == 'docs'
	testpath; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/ipython-genutils[${PYTHON_USEDEP}]
	json-logging? ( dev-python/json-logging[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	>=dev-python/nest-asyncio-1.5[${PYTHON_USEDEP}]
	>=dev-python/notebook-shim-0.2.3[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/nbval[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-playwright[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-unixsocket[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
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
