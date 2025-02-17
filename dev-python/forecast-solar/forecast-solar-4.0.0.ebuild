# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for getting forecast solar information"
HOMEPAGE="
  https://pypi.org/project/forecast-solar/
  Bug Tracker, https://github.com/home-assistant-libs/forecast_solar/issues
  Changelog, https://github.com/home-assistant-libs/forecast_solar/releases
  Documentation, https://github.com/home-assistant-libs/forecast_solar
  Repository, https://github.com/home-assistant-libs/forecast_solar
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	aiodns>=3.0.0
	aiohttp>=3.0.0
	yarl>=1.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiodns-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
