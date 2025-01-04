# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client providing energy/gas prices from easyEnergy"
HOMEPAGE="
  https://pypi.org/project/easyenergy/
  Bug Tracker, https://github.com/klaasnicolaas/python-easyenergy/issues
  Changelog, https://github.com/klaasnicolaas/python-easyenergy/releases
  Documentation, https://github.com/klaasnicolaas/python-easyenergy
  Repository, https://github.com/klaasnicolaas/python-easyenergy
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
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiodns[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="dev-python/aresponses[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-freezer[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
