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

REQUIRES_DIST="
	Cython; extra == 'development'
	asn1crypto<2.0.0,>0.24.0
	certifi>=2017.4.17
	cffi<2.0.0,>=1.9
	charset_normalizer<4,>=2
	coverage; extra == 'development'
	cryptography>=3.1.0
	filelock<4,>=3.5
	idna<4,>=2.5
	importlib-metadata; python_version < '3.8'
	keyring<26.0.0,>=23.1.0; extra == 'secure-local-storage'
	more-itertools; extra == 'development'
	numpy<1.27.0; extra == 'development'
	packaging
	pandas<3.0.0,>=1.0.0; extra == 'pandas'
	pendulum!=2.1.1; extra == 'development'
	pexpect; extra == 'development'
	platformdirs<5.0.0,>=2.6.0
	pyOpenSSL<25.0.0,>=22.0.0
	pyarrow; extra == 'pandas'
	pyjwt<3.0.0
	pytest-cov; extra == 'development'
	pytest-rerunfailures; extra == 'development'
	pytest-timeout; extra == 'development'
	pytest-xdist; extra == 'development'
	pytest<7.5.0; extra == 'development'
	pytz
	pytzdata; extra == 'development'
	requests<3.0.0
	sortedcontainers>=2.4.0
	tomlkit
	typing_extensions<5,>=4.3
	urllib3<2.0.0,>=1.21.1; python_version < '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}] <dev-python/asn1crypto-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.9[${PYTHON_USEDEP}] <dev-python/cffi-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/charset-normalizer-2[${PYTHON_USEDEP}] <dev-python/charset-normalizer-4[${PYTHON_USEDEP}]
	development? ( dev-python/coverage[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-3.1.0[${PYTHON_USEDEP}]
	development? ( dev-python/cython[${PYTHON_USEDEP}] )
	>=dev-python/filelock-3.5[${PYTHON_USEDEP}] <dev-python/filelock-4[${PYTHON_USEDEP}]
	>=dev-python/idna-2.5[${PYTHON_USEDEP}] <dev-python/idna-4[${PYTHON_USEDEP}]
	secure-local-storage? ( >=dev-python/keyring-23.1.0[${PYTHON_USEDEP}] <dev-python/keyring-26.0.0[${PYTHON_USEDEP}] )
	development? ( dev-python/more-itertools[${PYTHON_USEDEP}] )
	development? ( <dev-python/numpy-1.27.0[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	pandas? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	development? ( !~dev-python/pendulum-2.1.1[${PYTHON_USEDEP}] )
	development? ( dev-python/pexpect[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.6.0[${PYTHON_USEDEP}] <dev-python/platformdirs-5.0.0[${PYTHON_USEDEP}]
	pandas? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	<dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-22.0.0[${PYTHON_USEDEP}] <dev-python/pyopenssl-25.0.0[${PYTHON_USEDEP}]
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
	>=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND} dev-python/asn1crypto[${PYTHON_USEDEP}]
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
