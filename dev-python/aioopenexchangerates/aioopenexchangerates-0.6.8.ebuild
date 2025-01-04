# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Fetch rates from openexchangerates with aiohttp."
HOMEPAGE="
  https://pypi.org/project/aioopenexchangerates/
  Bug Tracker, https://github.com/MartinHjelmare/aioopenexchangerates/issues
  Changelog, https://github.com/MartinHjelmare/aioopenexchangerates/blob/main/CHANGELOG.md
  Documentation, https://aioopenexchangerates.readthedocs.io
  Repository, https://github.com/MartinHjelmare/aioopenexchangerates
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
