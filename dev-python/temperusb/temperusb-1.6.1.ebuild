# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Reads temperature from TEMPerV1 devices (USB 0c45:7401)"
HOMEPAGE="
  https://pypi.org/project/temperusb/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/pyusb[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pyusb[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
