# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ml-datasets/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	catalogue (<3.0.0,>=0.2.0)
	numpy (>=1.7.0)
	srsly (<3.0.0,>=1.0.1)
	tqdm (<5.0.0,>=4.10.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/catalogue-0.2.0[${PYTHON_USEDEP}] <dev-python/catalogue-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/srsly-1.0.1[${PYTHON_USEDEP}] <dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.10.0[${PYTHON_USEDEP}] <dev-python/tqdm-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
