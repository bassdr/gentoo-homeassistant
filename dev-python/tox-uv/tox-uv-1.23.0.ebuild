# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tox-uv/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	packaging>=24.2
	tox<5,>=4.24.1
	typing-extensions>=4.12.2; python_version < "3.10"
	uv<1,>=0.5.27
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/tox-4.24.1[${PYTHON_USEDEP}] <dev-python/tox-5[${PYTHON_USEDEP}]
	>=dev-python/uv-0.5.27[${PYTHON_USEDEP}] <dev-python/uv-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
