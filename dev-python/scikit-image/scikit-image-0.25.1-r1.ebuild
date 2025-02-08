# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=meson-python
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

TEST_DATA_COMMIT=15735b54e85c02427f07c71e6456723495034805
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scikit-image/"
SRC_URI+="
	test? (
		https://gitlab.com/scikit-image/data/-/archive/${TEST_DATA_COMMIT}/scikit-image-data-${TEST_DATA_COMMIT}.tar.bz2
	)
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="build data developer docs optional"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Cython>=3.0.8; extra == "build"
	PyWavelets>=1.6; extra == "docs"
	PyWavelets>=1.6; extra == "optional"
	SimpleITK; extra == "optional"
	astropy>=5.0; extra == "optional"
	asv; extra == "test"
	build>=1.2.1; extra == "build"
	cloudpickle>=0.2.1; extra == "optional"
	dask[array]!=2024.8.0,>=2021.1.0; extra == "optional"
	dask[array]>=2022.9.2; extra == "docs"
	imageio!=2.35.0,>=2.33
	intersphinx-registry>=0.2411.14; extra == "docs"
	ipykernel; extra == "docs"
	ipython; extra == "developer"
	ipywidgets; extra == "docs"
	kaleido==0.2.1; extra == "docs"
	lazy-loader>=0.4
	matplotlib>=3.7; extra == "docs"
	matplotlib>=3.7; extra == "optional"
	meson-python>=0.16; extra == "build"
	myst-parser; extra == "docs"
	networkx>=3.0
	ninja>=1.11.1.1; extra == "build"
	numpy>=1.24
	numpy>=2.0; extra == "build"
	numpydoc>=1.7; extra == "docs"
	numpydoc>=1.7; extra == "test"
	packaging>=21
	pandas>=2.0; extra == "docs"
	pillow>=10.1
	plotly>=5.20; extra == "docs"
	pooch>=1.6.0; extra == "data"
	pooch>=1.6.0; extra == "optional"
	pooch>=1.6.0; extra == "test"
	pooch>=1.6; extra == "docs"
	pre-commit; extra == "developer"
	pyamg>=5.2; extra == "optional"
	pydata-sphinx-theme>=0.16; extra == "docs"
	pytest-cov>=2.11.0; extra == "test"
	pytest-doctestplus; extra == "docs"
	pytest-doctestplus; extra == "test"
	pytest-faulthandler; extra == "test"
	pytest-localserver; extra == "test"
	pytest>=7.0; extra == "test"
	pythran>=0.16; extra == "build"
	scikit-learn>=1.2; extra == "docs"
	scikit-learn>=1.2; extra == "optional"
	scipy>=1.11.2
	seaborn>=0.11; extra == "docs"
	setuptools>=68; extra == "build"
	sphinx-copybutton; extra == "docs"
	sphinx-gallery[parallel]>=0.18; extra == "docs"
	sphinx>=8.0; extra == "docs"
	sphinx_design>=0.5; extra == "docs"
	spin==0.13; extra == "build"
	tifffile>=2022.8.12
	tifffile>=2022.8.12; extra == "docs"
	tomli; python_version < "3.11" and extra == "developer"
"
GENERATED_RDEPEND="${RDEPEND}
	optional? ( >=dev-python/astropy-5.0[${PYTHON_USEDEP}] )
	build? ( >=dev-python/build-1.2.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/cloudpickle-0.2.1[${PYTHON_USEDEP}] )
	build? ( >=dev-python/cython-3.0.8[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/dask-2022.9.2[array,${PYTHON_USEDEP}] )
	optional? ( >=dev-python/dask-2021.1.0[array,${PYTHON_USEDEP}] !~dev-python/dask-2024.8.0[array,${PYTHON_USEDEP}] )
	>=dev-python/imageio-2.33[${PYTHON_USEDEP}] !~dev-python/imageio-2.35.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/intersphinx-registry-0.2411.14[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	developer? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/kaleido-0.2.1[${PYTHON_USEDEP}] )
	>=dev-python/lazy-loader-0.4[${PYTHON_USEDEP}]
	docs? ( >=dev-python/matplotlib-3.7[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/matplotlib-3.7[${PYTHON_USEDEP}] )
	build? ( >=dev-python/meson-python-0.16[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/networkx-3.0[${PYTHON_USEDEP}]
	build? ( >=dev-python/ninja-1.11.1.1[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	build? ( >=dev-python/numpy-2.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/numpydoc-1.7[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21[${PYTHON_USEDEP}]
	docs? ( >=dev-python/pandas-2.0[${PYTHON_USEDEP}] )
	>=dev-python/pillow-10.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/plotly-5.20[${PYTHON_USEDEP}] )
	data? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pooch-1.6[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pyamg-5.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pydata-sphinx-theme-0.16[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest-doctestplus[${PYTHON_USEDEP}] )
	build? ( >=dev-python/pythran-0.16[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pywavelets-1.6[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pywavelets-1.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/scikit-learn-1.2[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/scikit-learn-1.2[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.11.2[${PYTHON_USEDEP}]
	docs? ( >=dev-python/seaborn-0.11[${PYTHON_USEDEP}] )
	build? ( >=dev-python/setuptools-68[${PYTHON_USEDEP}] )
	optional? ( dev-python/simpleitk[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-design-0.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-gallery-0.18[parallel,${PYTHON_USEDEP}] )
	build? ( ~dev-python/spin-0.13[${PYTHON_USEDEP}] )
	>=dev-python/tifffile-2022.8.12[${PYTHON_USEDEP}]
	docs? ( >=dev-python/tifffile-2022.8.12[${PYTHON_USEDEP}] )
	developer? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/imageio-2.36[${PYTHON_USEDEP}]
	>=dev-python/lazy-loader-0.4[${PYTHON_USEDEP}]
	>=dev-python/networkx-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.1[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.11.2[sparse(+),${PYTHON_USEDEP}]
	>=dev-python/tifffile-2022.8.12[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-python/cython-3.0.4[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
	)
"

# xdist does not work with this test suite
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/asv[${PYTHON_USEDEP}]
		>=dev-python/numpydoc-1.7[${PYTHON_USEDEP}]
		>=dev-python/pooch-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.11.0[${PYTHON_USEDEP}]
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/pytest-faulthandler[${PYTHON_USEDEP}]
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# There is a programmable error in your configuration file:
#distutils_enable_sphinx doc/source dev-python/numpydoc dev-python/myst-parser

src_test() {
	# for some reason, upstream refetches data that's already in the tarball
	# sigh
	mkdir -p "${HOME}/.cache/scikit-image" || die
	mv skimage "${HOME}/.cache/scikit-image/${PV/_/}" || die

	# This is a true horror, sigh
	local cache_dir=${HOME}/.cache/scikit-image/${PV/_/}/data
	pushd "${WORKDIR}/data-${TEST_DATA_COMMIT}" >/dev/null || die
	cp Tests_besides_Equalize_Otsu/add18_entropy/rank_filters_tests_3d.npz \
		Tests_besides_Equalize_Otsu/gray_morph_output.npz \
		brain.tiff cells3d.tif eagle.png \
		"${cache_dir}/" || die
	cp Normal_Epidermis_and_Dermis_with_Intradermal_Nevus_10x.JPG "${cache_dir}"/skin.jpg || die
	cp pivchallenge/B/B001_1.tif "${cache_dir}"/pivchallenge-B-B001_1.tif || die
	cp pivchallenge/B/B001_2.tif "${cache_dir}"/pivchallenge-B-B001_2.tif || die
	cp kidney-tissue-fluorescence.tif "${cache_dir}"/kidney.tif || die
	cp lily-of-the-valley-fluorescence.tif "${cache_dir}"/lily.tif || die
	cp astronaut_rl.npy "${cache_dir}/../restoration/tests/" || die
	popd > /dev/null || die

	distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# tests for downloading all data files, including these not needed
		# by any actual tests
		data/tests/test_data.py::test_download_all_with_pooch
		# hangs? TODO
		graph/tests/test_rag.py::test_reproducibility
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest --pyargs skimage -p localserver -o xfail_strict=False
}

pkg_postinst() {
	optfeature "FITS io capability" dev-python/astropy
	optfeature "GTK" dev-python/pygtk
	optfeature "io plugin providing most standard formats" dev-python/imread
	optfeature "plotting" dev-python/matplotlib
	optfeature "wavelet transformations" dev-python/pywavelets
	optfeature "io plugin providing a wide variety of formats, including specialized formats using in medical imaging." dev-python/simpleitk
}
