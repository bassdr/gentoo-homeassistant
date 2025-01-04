# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A Python library to interact with iotty CloudApi"
HOMEPAGE="
  https://pypi.org/project/iottycloud/
  Homepage, https://github.com/pburgio/iottycloud
  Bug Tracker, https://github.com/pburgio/iottycloud/issues
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
