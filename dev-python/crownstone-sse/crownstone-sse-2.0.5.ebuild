# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/crownstone-sse/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.7[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
