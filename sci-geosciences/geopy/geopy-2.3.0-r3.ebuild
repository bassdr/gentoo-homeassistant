# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python Geocoding Toolbox"
HOMEPAGE="
  https://pypi.org/project/geopy/
"
SRC_URI="https://github.com/geopy/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
# Need geocoding service to test
RESTRICT="test"

GENERATED_IUSE="aiohttp dev-docs dev-lint dev-test requests timezone"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev-test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dev-lint? ( <dev-python/flake8-5.1[${PYTHON_USEDEP}] )
	<dev-python/geographiclib-3[${PYTHON_USEDEP}]
	dev-lint? ( <dev-python/isort-5.11.0[${PYTHON_USEDEP}] )
	dev-test? ( >=dev-python/pytest-3.10[${PYTHON_USEDEP}] )
	dev-test? ( >=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}] )
	timezone? ( dev-python/pytz[${PYTHON_USEDEP}] )
	dev-docs? ( dev-python/readme-renderer[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/requests-2.16.2[${PYTHON_USEDEP}] )
	dev-docs? ( <=dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	dev-test? ( <=dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	dev-docs? ( dev-python/sphinx-issues[${PYTHON_USEDEP}] )
	dev-docs? ( >=dev-python/sphinx-rtd-theme-0.5.0[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
DEPEND="${RDEPEND}"
# GENERATED_BDEPEND could not be inserted in this ebuild
