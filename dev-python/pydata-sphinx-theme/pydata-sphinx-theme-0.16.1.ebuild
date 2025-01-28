# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

MY_P=${P/_/}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydata-sphinx-theme/"
SRC_URI="
	https://github.com/pydata/pydata-sphinx-theme/archive/v${PV/_/}.tar.gz
		-> ${P}.gh.tar.gz
	$(pypi_wheel_url)
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD-with-disclosure"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="a11y dev doc i18n test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
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
	dev? ( dev-python/pandoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/plotly[${PYTHON_USEDEP}] )
	dev? ( dev-python/pydata-sphinx-theme[doc,test,${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.7[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	a11y? ( dev-python/pytest-playwright[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	doc? ( dev-python/rich[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-6.1[${PYTHON_USEDEP}]
	test? ( dev-python/sphinx[test,${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-autoapi-3.0.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-favicon-1.0.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-sitemap[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-theme-builder[cli,${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinxcontrib-youtube-1.4.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxext-rediraffe[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	doc? ( dev-python/xarray[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
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
