# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/snowflake-connector-python/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="development pandas secure-local-storage"
IUSE="${GENERATED_IUSE} +secure-local-storage pandas"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/asn1crypto-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	<dev-python/cffi-2.0.0[${PYTHON_USEDEP}]
	<dev-python/charset-normalizer-4[${PYTHON_USEDEP}]
	development? ( dev-python/coverage[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-3.1.0[${PYTHON_USEDEP}]
	development? ( dev-python/cython[${PYTHON_USEDEP}] )
	<dev-python/filelock-4[${PYTHON_USEDEP}]
	<dev-python/idna-4[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	secure-local-storage? ( <dev-python/keyring-26.0.0[${PYTHON_USEDEP}] )
	development? ( dev-python/more-itertools[${PYTHON_USEDEP}] )
	development? ( <dev-python/numpy-1.27.0[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	pandas? ( <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	development? ( !=dev-python/pendulum-2.1.1[${PYTHON_USEDEP}] )
	development? ( dev-python/pexpect[${PYTHON_USEDEP}] )
	<dev-python/platformdirs-5.0.0[${PYTHON_USEDEP}]
	pandas? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	<dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pyopenssl-25.0.0[${PYTHON_USEDEP}]
	development? ( <dev-python/pytest-7.5.0[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest-rerunfailures[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	development? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	dev-python/pytz[${PYTHON_USEDEP}]
	development? ( dev-python/pytzdata[${PYTHON_USEDEP}] )
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/asn1crypto[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/charset-normalizer[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/filelock[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	pandas? (
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
	)
	secure-local-storage? (
		dev-python/keyring[${PYTHON_USEDEP}]
	)"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
