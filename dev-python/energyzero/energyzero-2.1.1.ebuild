# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Asynchronous Python client providing energy/gas prices from EnergyZero"
HOMEPAGE="
  https://pypi.org/project/energyzero/
  Bug Tracker, https://github.com/klaasnicolaas/python-energyzero/issues
  Changelog, https://github.com/klaasnicolaas/python-energyzero/releases
  Documentation, https://github.com/klaasnicolaas/python-energyzero
  Repository, https://github.com/klaasnicolaas/python-energyzero
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/yarl[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]"

distutils_enable_tests pytest