# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="accelerated daemon quic sshtunnel"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pproxy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	quic? ( >=dev-python/aioquic-0.9.7[${PYTHON_USEDEP}] )
	sshtunnel? ( >=dev-python/asyncssh-2.5.0[${PYTHON_USEDEP}] )
	accelerated? ( >=dev-python/pycryptodome-3.7.2[${PYTHON_USEDEP}] )
	daemon? ( >=dev-python/python-daemon-2.2.3[${PYTHON_USEDEP}] )
	accelerated? ( >=dev-python/uvloop-0.13.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
