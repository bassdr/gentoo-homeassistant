# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pipreqs/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	docopt (==0.6.2)
	ipython (==8.12.3)
	nbconvert (>=7.11.0,<8.0.0)
	yarg (==0.1.9)
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	~dev-python/ipython-8.12.3[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-7.11.0[${PYTHON_USEDEP}] <dev-python/nbconvert-8.0.0[${PYTHON_USEDEP}]
	~dev-python/yarg-0.1.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
