# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Happy Eyeballs for asyncio"
HOMEPAGE="
  https://pypi.org/project/aiohappyeyeballs/
  Bug Tracker, https://github.com/aio-libs/aiohappyeyeballs/issues
  Changelog, https://github.com/aio-libs/aiohappyeyeballs/blob/main/CHANGELOG.md
  Documentation, https://aiohappyeyeballs.readthedocs.io
  Repository, https://github.com/aio-libs/aiohappyeyeballs
"
SRC_URI="
	https://github.com/aio-libs/aiohappyeyeballs/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.23.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -o addopts=
}
