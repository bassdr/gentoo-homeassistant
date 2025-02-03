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
GENERATED_IUSE="secure socks"
IUSE="${GENERATED_IUSE} brotli +secure +socks"

GENERATED_RDEPEND="${RDEPEND}
	=dev-python/brotli-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/brotli-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/brotlicffi-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/brotlipy-0.6.0[${PYTHON_USEDEP}]
	secure? ( dev-python/certifi[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/cryptography-1.3.4[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/idna-2.0.0[${PYTHON_USEDEP}] )
	secure? ( >=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}] )
	socks? ( !=dev-python/pysocks-1.5.7[${PYTHON_USEDEP}] )
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
		>=dev-python/brotli-1.0.9[${PYTHON_USEDEP}]
		>=dev-python/brotlicffi-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/brotlipy-0.6.0[${PYTHON_USEDEP}]
	)
"
