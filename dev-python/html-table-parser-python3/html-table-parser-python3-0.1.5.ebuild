# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A small and simple HTML table parser not requiring any external dependency."
HOMEPAGE="
  https://pypi.org/project/html-table-parser-python3/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


EPYTEST_XDIST=1
distutils_enable_tests pytest
