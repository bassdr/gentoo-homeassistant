# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Microsoft Azure Blob Storage Client Library for Python"
HOMEPAGE="
  https://pypi.org/project/azure-storage-blob/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	azure-core
	cryptography
	isodate
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/azure-core[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/isodate[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/azure-core-1.28.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.28.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
