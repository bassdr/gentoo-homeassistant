# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Simple API to access Netatmo weather station data from any Python 3 script. Designed for Home Assistant (but not only)"
HOMEPAGE="
  https://pypi.org/project/pyatmo/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]
	~dev-python/oauthlib-3.1[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	~dev-python/requests-2.24[${PYTHON_USEDEP}]
	<dev-python/requests-oauthlib-3.0[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
