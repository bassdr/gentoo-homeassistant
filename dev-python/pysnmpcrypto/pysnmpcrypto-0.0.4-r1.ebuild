# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Strong cryptography support for PySNMP (SNMP library for Python)"
HOMEPAGE="
  https://pypi.org/project/pysnmpcrypto/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	cryptography; python_version == "2.7"
	cryptography; python_version >= "3.4"
	pycryptodomex; python_version < "2.7"
	pycryptodomex; python_version == "3.0"
	pycryptodomex; python_version == "3.1"
	pycryptodomex; python_version == "3.2"
	pycryptodomex; python_version == "3.3"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
