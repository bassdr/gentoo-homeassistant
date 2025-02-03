# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python library to access the FYTA API"
HOMEPAGE="
  https://pypi.org/project/fyta_cli/
  Repository, https://github.com/dontinelli/fyta_cli.git
  Issues, https://github.com/dontinelli/fyta_cli/issues
  Changelog, https://github.com/dontinelli/fyta_cli/blob/master/CHANGELOG.md
  FYTA homepage, https://fyta.de/
  API Documentation, https://fyta-io.notion.site/FYTA-Public-API-d2f4c30306f74504924c9a40402a3afd
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
