# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/retrolab/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	jupyter-server (~=1.4)
	jupyterlab (~=3.4.0)
	jupyterlab-server (~=2.3)
	nbclassic (~=0.2)
	tornado (>=6.1.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jupyter-server-1.4[${PYTHON_USEDEP}] =dev-python/jupyter-server-1*[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-3.4.0[${PYTHON_USEDEP}] =dev-python/jupyterlab-3.4*[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-server-2.3[${PYTHON_USEDEP}] =dev-python/jupyterlab-server-2*[${PYTHON_USEDEP}]
	>=dev-python/nbclassic-0.2[${PYTHON_USEDEP}] =dev-python/nbclassic-0*[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
