# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Tools for converting bluetooth data and packets"
HOMEPAGE="
  https://pypi.org/project/bluetooth-data-tools/
  Bug Tracker, https://github.com/bdraco/bluetooth-data-tools/issues
  Changelog, https://github.com/bdraco/bluetooth-data-tools/blob/main/CHANGELOG.md
  Documentation, https://bluetooth-data-tools.readthedocs.io
  Repository, https://github.com/bdraco/bluetooth-data-tools
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cryptography-41.0.3[${PYTHON_USEDEP}]
	>=dev-python/cython-3.0.2[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# RDEPEND could not be inserted in this ebuild
# Content: 
