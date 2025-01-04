# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Library to parse Dutch Smart Meter Requirements (DSMR)"
HOMEPAGE="
  https://pypi.org/project/dsmr-parser/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/tailer[${PYTHON_USEDEP}]
	dev-python/dlms-cosem[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	~dev-python/tailer-0.4.1[${PYTHON_USEDEP}]
	~dev-python/dlms-cosem-21.3.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
