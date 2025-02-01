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
  https://pypi.org/project/entangled-cli/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/argh-0.30[${PYTHON_USEDEP}]
	>=dev-python/brei-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/copier-8.3.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.12.0[${PYTHON_USEDEP}]
	>=dev-python/mawk-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/rich-13.3.5[${PYTHON_USEDEP}]
	>=dev-python/rich-argparse-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/watchdog-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
