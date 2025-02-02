# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control Steamist steam systems"
HOMEPAGE="
  https://pypi.org/project/aiosteamist/
  Bug Tracker, https://github.com/bdraco/aiosteamist/issues
  Changelog, https://aiosteamist.readthedocs.io/changelog.html
  Documentation, https://aiosteamist.readthedocs.io
  Repository, https://github.com/bdraco/aiosteamist
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.16.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
