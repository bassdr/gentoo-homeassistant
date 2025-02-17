# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all libjpeg openjpeg rle"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pylibjpeg/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black>=23.12; extra == 'dev'
	mypy>=1.8; extra == 'dev'
	numpy
	pylibjpeg-libjpeg; extra == 'all'
	pylibjpeg-libjpeg; extra == 'libjpeg'
	pylibjpeg-openjpeg; extra == 'all'
	pylibjpeg-openjpeg; extra == 'openjpeg'
	pylibjpeg-rle; extra == 'all'
	pylibjpeg-rle; extra == 'rle'
	pytest-cov; extra == 'dev'
	pytest; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	all? ( dev-python/pylibjpeg-libjpeg[${PYTHON_USEDEP}] )
	libjpeg? ( dev-python/pylibjpeg-libjpeg[${PYTHON_USEDEP}] )
	all? ( dev-python/pylibjpeg-openjpeg[${PYTHON_USEDEP}] )
	openjpeg? ( dev-python/pylibjpeg-openjpeg[${PYTHON_USEDEP}] )
	all? ( dev-python/pylibjpeg-rle[${PYTHON_USEDEP}] )
	rle? ( dev-python/pylibjpeg-rle[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-23.12[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
