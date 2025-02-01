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
  https://pypi.org/project/weasel/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/cloudpathlib-1.0.0[${PYTHON_USEDEP}]
	<dev-python/confection-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	!=dev-python/pydantic-1.8[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	<dev-python/smart-open-8.0.0[${PYTHON_USEDEP}]
	<dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	<dev-python/typer-1.0.0[${PYTHON_USEDEP}]
	<dev-python/wasabi-1.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
