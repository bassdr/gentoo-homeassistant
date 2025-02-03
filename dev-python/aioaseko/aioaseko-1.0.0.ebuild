# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python package for the Aseko Pool Live API"
HOMEPAGE="
  https://pypi.org/project/aioaseko/
  Homepage, https://github.com/milanmeu/aioaseko
  Bug Tracker, https://github.com/milanmeu/aioaseko/issues
  Source Code, https://github.com/milanmeu/aioaseko/tree/main/aioaseko
  Documentation, https://github.com/milanmeu/aioaseko/blob/main/README.md
  Donate, https://github.com/sponsors/milanmeu
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/apischema[${PYTHON_USEDEP}]
	dev-python/gql[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/gql[${PYTHON_USEDEP}]
	dev-python/apischema[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
