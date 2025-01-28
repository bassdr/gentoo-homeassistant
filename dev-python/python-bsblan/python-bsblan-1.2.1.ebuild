# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for BSBLAN API"
HOMEPAGE="
  https://pypi.org/project/python-bsblan/
  Bug Tracker, https://github.com/liudger/python-bsblan/issues
  Changelog, https://github.com/liudger/python-bsblan/releases
  Documentation, https://github.com/liudger/python-bsblan
  Repository, https://github.com/liudger/python-bsblan
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/async-timeout-5.0.0[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	<dev-python/backoff-3.0.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	<dev-python/mashumaro-4.0.0[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	<dev-python/orjson-4.0.0[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.7.2[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.7.2[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.10[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
