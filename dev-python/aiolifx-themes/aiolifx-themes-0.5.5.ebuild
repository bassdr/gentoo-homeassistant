# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async library that applies color themes to LIFX lights"
HOMEPAGE="
  https://pypi.org/project/aiolifx-themes/
  Bug Tracker, https://github.com/Djelibeybi/aiolifx-themes/issues
  Changelog, https://github.com/Djelibeybi/aiolifx-themes/blob/main/CHANGELOG.md
  Documentation, https://aiolifx-themes.readthedocs.io
  Repository, https://github.com/Djelibeybi/aiolifx-themes
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/aiolifx-2.0.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/myst-parser-4.0.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-8.0.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-rtd-theme-3.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiolifx-1.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
