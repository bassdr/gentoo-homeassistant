# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="developer docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cucim-cu12/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	developer? ( dev-python/black[${PYTHON_USEDEP}] )
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/cupy-cuda12x-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/imagecodecs-2021.6.8[${PYTHON_USEDEP}]
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	developer? ( dev-python/isort[${PYTHON_USEDEP}] )
	>=dev-python/lazy-loader-0.1[${PYTHON_USEDEP}]
	docs? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	<dev-python/numpy-3.0_alpha0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/numpydoc-1.5[${PYTHON_USEDEP}] )
	>=dev-python/openslide-python-1.3.0[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	developer? ( dev-python/ruff[${PYTHON_USEDEP}] )
	<dev-python/scikit-image-0.25.0_alpha0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-6[${PYTHON_USEDEP}] )
	developer? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
		>=dev-python/numpydoc-1.5[${PYTHON_USEDEP}]
		>=dev-python/opencv-python-headless-4.6[${PYTHON_USEDEP}]
		>=dev-python/pooch-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
		<dev-python/pytest-8.0.0_alpha0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.12.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-lazy-fixtures-1.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		>=dev-python/pywavelets-1.0[${PYTHON_USEDEP}]
		>=dev-python/tifffile-2022.7.28[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
