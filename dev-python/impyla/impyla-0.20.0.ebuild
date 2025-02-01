# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="kerberos"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/impyla/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/bitarray-3[${PYTHON_USEDEP}]
	kerberos? ( >=dev-python/kerberos-1.3.0[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
	~dev-python/thrift-0.16.0[${PYTHON_USEDEP}]
	~dev-python/thrift-sasl-0.4.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
