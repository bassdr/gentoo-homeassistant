# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
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
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiodns-3.0.0[${PYTHON_USEDEP}]"

# fill empty package version
src_prepare() {
	sed 's/os.environ.get("PACKAGE_VERSION")/"'"${PV}"'"/g' -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
