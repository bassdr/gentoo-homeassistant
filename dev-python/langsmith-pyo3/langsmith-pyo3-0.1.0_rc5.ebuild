# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "langsmith-pyo3" "0.1.0rc5")"
S="${WORKDIR}/langsmith-pyo3-0.1.0rc5"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langsmith-pyo3/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

distutils_enable_tests pytest