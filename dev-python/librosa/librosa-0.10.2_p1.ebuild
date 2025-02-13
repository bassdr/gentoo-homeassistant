# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="display docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.10.2.post1)"
S="${WORKDIR}/${PN}-0.10.2.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/librosa/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/audioread-2.1.9[${PYTHON_USEDEP}]
	>=dev-python/decorator-4.3.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/ipython-7.0[${PYTHON_USEDEP}] )
	>=dev-python/joblib-0.14[${PYTHON_USEDEP}]
	>=dev-python/lazy-loader-0.1[${PYTHON_USEDEP}]
	display? ( >=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mir-eval-0.5[${PYTHON_USEDEP}] )
	>=dev-python/msgpack-1.0[${PYTHON_USEDEP}]
	>=dev-python/numba-0.51.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/numba-0.51[${PYTHON_USEDEP}] )
	!=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/pooch-1.1[${PYTHON_USEDEP}]
	docs? ( dev-python/presets[${PYTHON_USEDEP}] )
	>=dev-python/scikit-learn-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/soxr-0.3.2[${PYTHON_USEDEP}]
	docs? ( !=dev-python/sphinx-1.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-gallery-0.7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-multiversion-0.2.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-svg2pdfconverter[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-mpl[${PYTHON_USEDEP}]
	>=dev-python/resampy-0.2.2[${PYTHON_USEDEP}]
	dev-python/samplerate[${PYTHON_USEDEP}]
	dev-python/types-decorator[${PYTHON_USEDEP}]
)"
