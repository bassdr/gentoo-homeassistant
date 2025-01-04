# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools for converting python data types"
HOMEPAGE="
  https://pypi.org/project/convertertools/
  Bug Tracker, https://github.com/bluetooth-devices/convertertools/issues
  Changelog, https://github.com/bluetooth-devices/convertertools/blob/main/CHANGELOG.md
  Documentation, https://convertertools.readthedocs.io
  Repository, https://github.com/bluetooth-devices/convertertools
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
distutils_enable_tests pytest
