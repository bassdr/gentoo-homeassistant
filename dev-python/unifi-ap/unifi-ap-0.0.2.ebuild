# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="unifi_ap"

inherit distutils-r1 pypi

DESCRIPTION="Python API for UniFi accesspoints"
HOMEPAGE="
  https://pypi.org/project/unifi_ap/
  Homepage, https://github.com/tofuSCHNITZEL/unifi_ap
  Issues, https://github.com/tofuSCHNITZEL/unifi_ap/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/paramiko[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/paramiko[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
