# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-dotenv/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pytest (>=5.0.0)
	python-dotenv (>=0.9.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.9.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
