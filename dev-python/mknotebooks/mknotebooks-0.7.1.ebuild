# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mknotebooks/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	gitpython
	jupyter-client
	markdown (>=3.3.3)
	mkdocs (>=1.1)
	nbconvert (>=6.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/jupyter-client[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.3.3[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.1[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
