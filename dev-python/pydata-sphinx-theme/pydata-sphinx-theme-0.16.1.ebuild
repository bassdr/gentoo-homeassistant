# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

MY_P=${P/_/}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydata_sphinx_theme/"
LICENSE="BSD-with-disclosure"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="a11y doc i18n"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( >=dev-python/ablog-0.11.8[${PYTHON_USEDEP}] )
	dev-python/accessible-pygments[${PYTHON_USEDEP}]
	dev-python/babel[${PYTHON_USEDEP}]
	i18n? ( dev-python/babel[${PYTHON_USEDEP}] )
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	doc? ( dev-python/colorama[${PYTHON_USEDEP}] )
	!=dev-python/docutils-0.17.0[${PYTHON_USEDEP}]
	doc? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipyleaflet[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	i18n? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyter-sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyterlite-sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/linkify-it-py[${PYTHON_USEDEP}] )
	doc? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpy[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/pandas[${PYTHON_USEDEP}] )
	doc? ( dev-python/plotly[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.7[${PYTHON_USEDEP}]
	a11y? ( dev-python/pytest-playwright[${PYTHON_USEDEP}] )
	doc? ( dev-python/rich[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-6.1[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-autoapi-3.0.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-favicon-1.0.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-sitemap[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinxcontrib-youtube-1.4.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxext-rediraffe[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	doc? ( dev-python/xarray[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/accessible-pygments[${PYTHON_USEDEP}]
	dev-python/babel[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.7[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6.1[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pandoc[${PYTHON_USEDEP}]
		dev-python/pydata-sphinx-theme[doc,test,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/sphinx[test,${PYTHON_USEDEP}]
		dev-python/sphinx-theme-builder[cli,${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# pygments version mismatch?
	'tests/test_build.py::test_pygments_fallbacks[real]'
	# Requires sphinx-intl
	'tests/test_build.py::test_translations'
)

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/$(pypi_wheel_name)"
}
