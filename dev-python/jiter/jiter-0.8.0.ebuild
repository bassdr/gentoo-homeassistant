# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Fast iterable JSON parser."
HOMEPAGE="
  https://pypi.org/project/jiter/
  Source Code, https://github.com/pydantic/jiter/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

EPYTEST_XDIST=1
distutils_enable_tests pytest
