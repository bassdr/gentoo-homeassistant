# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="asyncio-friendly python API for Sensibo"
HOMEPAGE="
  https://pypi.org/project/pysensibo/
  Bug Tracker, https://github.com/andrey-git/pysensibo/issues
  Changelog, https://github.com/andrey-git/pysensibo/releases
  Documentation, https://github.com/andrey-git/pysensibo
  Repository, https://github.com/andrey-git/pysensibo
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest