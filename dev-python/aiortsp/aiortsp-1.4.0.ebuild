# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An asyncio-based RTSP library"
HOMEPAGE="
  https://pypi.org/project/aiortsp/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/dpkt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/dpkt[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
