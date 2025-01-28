# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbconvert/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all docs qtpdf qtpng serve test webpdf"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	!=dev-python/bleach-5.0.0[css,${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	all? ( dev-python/flaky[${PYTHON_USEDEP}] )
	test? ( dev-python/flaky[${PYTHON_USEDEP}] )
	all? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	test? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipywidgets-7.5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/ipywidgets-7.5[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.7[${PYTHON_USEDEP}]
	dev-python/jupyterlab-pygments[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	<dev-python/mistune-4[${PYTHON_USEDEP}]
	all? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/nbclient-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.7[${PYTHON_USEDEP}]
	all? ( >=dev-python/nbsphinx-0.2.12[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/nbsphinx-0.2.12[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandocfilters-1.4.1[${PYTHON_USEDEP}]
	all? ( dev-python/playwright[${PYTHON_USEDEP}] )
	webpdf? ( dev-python/playwright[${PYTHON_USEDEP}] )
	all? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.4.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyqtwebengine-5.15[${PYTHON_USEDEP}] )
	qtpdf? ( >=dev-python/pyqtwebengine-5.15[${PYTHON_USEDEP}] )
	qtpng? ( >=dev-python/pyqtwebengine-5.15[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-7[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-7[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-5.0.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-5.0.2[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tornado-6.1[${PYTHON_USEDEP}] )
	serve? ( >=dev-python/tornado-6.1[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.7[${PYTHON_USEDEP}]
	dev-python/jupyterlab-pygments[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	<dev-python/mistune-4[${PYTHON_USEDEP}]
	>=dev-python/nbclient-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.7[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandocfilters-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1.1[${PYTHON_USEDEP}]
"
# via bleach[css]
RDEPEND+="
	dev-python/tinycss2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		>=dev-python/ipywidgets-7.5[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		tests/test_nbconvertapp.py::TestNbConvertApp::test_convert_full_qualified_name
		tests/test_nbconvertapp.py::TestNbConvertApp::test_post_processor
		# crazy qtweb* stuff, perhaps permissions
		tests/exporters/test_qtpdf.py::TestQtPDFExporter::test_export
		tests/exporters/test_qtpng.py::TestQtPNGExporter::test_export
	)

	# virtx implies nonfatal, make it explicit to avoid confusion
	# tests/preprocessors/test_execute.py are extremely flaky over output
	# buffering
	nonfatal epytest --reruns=10 || die
}

pkg_postinst() {
	if ! has_version virtual/pandoc; then
		einfo "Pandoc is required for converting to formats other than Python,"
		einfo "HTML, and Markdown. If you need this functionality, install"
		einfo "app-text/pandoc or app-text/pandoc-bin."
	fi
}
