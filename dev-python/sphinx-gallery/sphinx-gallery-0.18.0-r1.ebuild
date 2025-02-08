# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-gallery/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="animations jupyterlite parallel recommender show-api-usage show-memory"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	absl-py; extra == "dev"
	graphviz; extra == "dev"
	graphviz; extra == "show-api-usage"
	intersphinx-registry; extra == "dev"
	ipython; extra == "dev"
	joblib; extra == "dev"
	joblib; extra == "parallel"
	jupyterlite-sphinx; extra == "dev"
	jupyterlite-sphinx; extra == "jupyterlite"
	lxml; extra == "dev"
	matplotlib; extra == "dev"
	memory-profiler; extra == "show-memory"
	numpy; extra == "dev"
	numpy; extra == "recommender"
	packaging; extra == "dev"
	pillow
	plotly; extra == "dev"
	pydata-sphinx-theme; extra == "dev"
	pytest-coverage; extra == "dev"
	pytest; extra == "dev"
	seaborn; extra == "dev"
	sphinx>=5
	sphinxcontrib-video; extra == "animations"
	sphinxcontrib-video; extra == "dev"
	statsmodels; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	show-api-usage? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	parallel? ( dev-python/joblib[${PYTHON_USEDEP}] )
	jupyterlite? ( dev-python/jupyterlite-sphinx[${PYTHON_USEDEP}] )
	show-memory? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	recommender? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	animations? ( dev-python/sphinxcontrib-video[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/joblib[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/graphviz[${PYTHON_USEDEP}]
		dev-python/intersphinx-registry[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/joblib[${PYTHON_USEDEP}]
		dev-python/jupyterlite-sphinx[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-coverage[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-video[${PYTHON_USEDEP}]
		dev-python/statsmodels[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		sphinx_gallery/tests/test_docs_resolv.py::test_embed_code_links_get_data
		sphinx_gallery/tests/test_full.py::test_run_sphinx
		sphinx_gallery/tests/test_full.py::test_embed_links_and_styles
		# require jupyterlite_sphinx
		sphinx_gallery/tests/test_full.py
		sphinx_gallery/tests/test_full_noexec.py
		sphinx_gallery/tests/test_gen_gallery.py::test_create_jupyterlite_contents
		sphinx_gallery/tests/test_gen_gallery.py::test_create_jupyterlite_contents_non_default_contents
		sphinx_gallery/tests/test_gen_gallery.py::test_create_jupyterlite_contents_with_jupyterlite_disabled_via_config
	)

	epytest -o addopts=
}
