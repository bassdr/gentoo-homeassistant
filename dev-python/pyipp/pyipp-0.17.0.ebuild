# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Internet Printing Protocol (IPP)"
HOMEPAGE="
  https://pypi.org/project/pyipp/
  Bug Tracker, https://github.com/ctalkington/python-ipp/issues
  Changelog, https://github.com/ctalkington/python-ipp/releases
  Documentation, https://github.com/ctalkington/python-ipp
  Repository, https://github.com/ctalkington/python-ipp
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-1.1.0[${PYTHON_USEDEP}]
	dev-python/deepmerge[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
