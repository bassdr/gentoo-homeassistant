# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library to control Comelit Simplehome"
HOMEPAGE="
  https://pypi.org/project/aiocomelit/
  Bug Tracker, https://github.com/chemelli74/aiocomelit/issues
  Changelog, https://github.com/chemelli74/aiocomelit/blob/main/CHANGELOG.md
  Repository, https://github.com/chemelli74/aiocomelit
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	colorlog
	pint
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/pint[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
