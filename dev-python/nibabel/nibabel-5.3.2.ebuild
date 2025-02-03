# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all dicom dicomfs doc doctest minc2 spm style typing zstd"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nibabel/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/h5py[${PYTHON_USEDEP}] )
	minc2? ( dev-python/h5py[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/importlib-resources-5.12[${PYTHON_USEDEP}]' python3_12)
	doc? ( >=dev-python/matplotlib-3.5[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20[${PYTHON_USEDEP}]
	all? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dicomfs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pydicom-2.3[${PYTHON_USEDEP}] )
	dicom? ( >=dev-python/pydicom-2.3[${PYTHON_USEDEP}] )
	dicomfs? ( >=dev-python/pydicom-2.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyzstd-0.14.3[${PYTHON_USEDEP}] )
	zstd? ( >=dev-python/pyzstd-0.14.3[${PYTHON_USEDEP}] )
	all? ( dev-python/scipy[${PYTHON_USEDEP}] )
	spm? ( dev-python/scipy[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/texext[${PYTHON_USEDEP}] )
	doctest? ( dev-python/tox[${PYTHON_USEDEP}] )
	style? ( dev-python/tox[${PYTHON_USEDEP}] )
	typing? ( dev-python/tox[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.2[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
