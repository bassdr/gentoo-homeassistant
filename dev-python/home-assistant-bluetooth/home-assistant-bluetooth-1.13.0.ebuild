# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Home Assistant Bluetooth Models and Helpers"
HOMEPAGE="
  https://pypi.org/project/home-assistant-bluetooth/
  Bug Tracker, https://github.com/home-assistant-libs/home-assistant-bluetooth/issues
  Changelog, https://github.com/home-assistant-libs/home-assistant-bluetooth/blob/main/CHANGELOG.md
  Repository, https://github.com/home-assistant-libs/home-assistant-bluetooth
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/habluetooth-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/habluetooth-3.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
