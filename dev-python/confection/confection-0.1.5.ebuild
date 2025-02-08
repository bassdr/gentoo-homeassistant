# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/confection/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pydantic!=1.8,!=1.8.1,<3.0.0,>=1.7.4
	srsly<3.0.0,>=2.4.0
	typing-extensions<5.0.0,>=3.7.4.1; python_version < "3.8"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}] !~dev-python/pydantic-1.8[${PYTHON_USEDEP}] !~dev-python/pydantic-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.0[${PYTHON_USEDEP}] <dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
