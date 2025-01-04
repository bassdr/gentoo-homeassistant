# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Models for storing and converting Sensor Data state"
HOMEPAGE="
  https://pypi.org/project/sensor-state-data/
  Bug Tracker, https://github.com/bluetooth-devices/sensor-state-data/issues
  Changelog, https://github.com/bluetooth-devices/sensor-state-data/blob/main/CHANGELOG.md
  Documentation, https://sensor-state-data.readthedocs.io
  Repository, https://github.com/bluetooth-devices/sensor-state-data
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
