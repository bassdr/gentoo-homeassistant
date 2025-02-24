# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_TESTED=( python3_{10..13} pypy3 )
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="ssl(+)"

inherit distutils-r1 pypi

# The package has a test dependency on their own hypercorn fork.
HYPERCORN_COMMIT=d1719f8c1570cbd8e6a3719ffdb14a4d72880abb
DESCRIPTION="HTTP library with thread-safe connection pooling, file post, and more."
HOMEPAGE="
  https://pypi.org/project/urllib3/
  Documentation, https://urllib3.readthedocs.io/
  Code, https://github.com/urllib3/urllib3
  Issue tracker, https://github.com/urllib3/urllib3/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="brotli secure socks"
IUSE="${GENERATED_IUSE} brotli +secure +socks"

REQUIRES_DIST="
	PySocks!=1.5.7,<2.0,>=1.5.6; extra == 'socks'
	brotli==1.0.9; (os_name != 'nt' and python_version < '3' and platform_python_implementation == 'CPython') and extra == 'brotli'
	brotli>=1.0.9; (python_version >= '3' and platform_python_implementation == 'CPython') and extra == 'brotli'
	brotlicffi>=0.8.0; ((os_name != 'nt' or python_version >= '3') and platform_python_implementation != 'CPython') and extra == 'brotli'
	brotlipy>=0.6.0; (os_name == 'nt' and python_version < '3') and extra == 'brotli'
	certifi; extra == 'secure'
	cryptography>=1.3.4; extra == 'secure'
	idna>=2.0.0; extra == 'secure'
	ipaddress; python_version == '2.7' and extra == 'secure'
	pyOpenSSL>=0.14; extra == 'secure'
	urllib3-secure-extra; extra == 'secure'
"
GENERATED_RDEPEND="${RDEPEND}
	brotli? ( >=app-arch/brotli-1.0.9[python,${PYTHON_USEDEP}] )
	secure? ( dev-python/certifi[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/cryptography-1.3.4[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/idna-2.0.0[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}] )
	socks? ( >=dev-python/pysocks-1.5.6[${PYTHON_USEDEP}] <dev-python/pysocks-2.0[${PYTHON_USEDEP}] !~dev-python/pysocks-1.5.7[${PYTHON_USEDEP}] )
	secure? ( dev-python/urllib3-secure-extra[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	secure? (
		>=dev-python/cryptography-1.3.4[${PYTHON_USEDEP}]
		>=dev-python/idna-2.0.0[${PYTHON_USEDEP}]
		dev-python/certifi
	)
	socks? ( >=dev-python/pysocks-1.5.8[${PYTHON_USEDEP}] <dev-python/pysocks-2.0[${PYTHON_USEDEP}] )
	brotli? (
		>=app-arch/brotli-1.0.9[python,${PYTHON_USEDEP}]
		>=dev-python/brotlicffi-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/brotlipy-0.6.0[${PYTHON_USEDEP}]
	)
"
