# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rliable/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/absl-py-0.9.0[${PYTHON_USEDEP}]
	<dev-python/arch-8.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/seaborn-0.11.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
