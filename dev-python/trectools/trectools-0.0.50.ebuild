# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/trectools/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bs4>=0.0.0.1
	lxml>=3.6.0
	matplotlib>=1.5
	numpy>=1.0.0
	pandas>=0.15.0
	sarge>=0.1.1
	scikit-learn>=0.15
	scipy>=0.10.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/beautifulsoup4-0.0.0.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-1.5[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/sarge-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.15[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
