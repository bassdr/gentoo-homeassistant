# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Microsoft Azure Azure Queue Storage Client Library for Python"
HOMEPAGE="
  https://pypi.org/project/azure-storage-queue/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="aio"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	azure-core>=1.30.0
	azure-core[aio]>=1.30.0; extra == "aio"
	cryptography>=2.1.4
	isodate>=0.6.1
	typing-extensions>=4.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-core-1.30.0[${PYTHON_USEDEP}]
	aio? ( >=dev-python/azure-core-1.30.0[aio,${PYTHON_USEDEP}] )
	>=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/azure-core-1.28.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
