# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An API client for Roth's TouchlineSL control system."
HOMEPAGE="
  https://pypi.org/project/pytouchlinesl/
  Homepage, https://github.com/jnsgruk/pytouchlinesl
  Issues, https://github.com/jnsgruk/pytouchlinesl/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	pydantic
	pytest-asyncio; extra == 'dev'
	pytest; extra == 'dev'
	ruff; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
