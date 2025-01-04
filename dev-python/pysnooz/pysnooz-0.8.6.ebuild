# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control SNOOZ white noise machines."
HOMEPAGE="
  https://pypi.org/project/pysnooz/
  Bug Tracker, https://github.com/AustinBrunkhorst/pysnooz/issues
  Changelog, https://github.com/AustinBrunkhorst/pysnooz/blob/main/CHANGELOG.md
  Repository, https://github.com/AustinBrunkhorst/pysnooz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	dev-python/events[${PYTHON_USEDEP}]
	dev-python/transitions[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/Events-0.4[${PYTHON_USEDEP}]
	>=dev-python/transitions-0.8.11[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
