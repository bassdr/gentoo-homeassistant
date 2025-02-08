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
REQUIRES_DIST="
	aiohttp ; extra == 'aiohttp'
	coverage ; extra == 'dev'
	coverage ; extra == 'dev-test'
	flake8 (<5.1,>=5.0) ; extra == 'dev'
	flake8 (<5.1,>=5.0) ; extra == 'dev-lint'
	geographiclib (<3,>=1.52)
	isort (<5.11.0,>=5.10.0) ; extra == 'dev'
	isort (<5.11.0,>=5.10.0) ; extra == 'dev-lint'
	pytest (>=3.10) ; extra == 'dev'
	pytest (>=3.10) ; extra == 'dev-test'
	pytest-asyncio (>=0.17) ; extra == 'dev'
	pytest-asyncio (>=0.17) ; extra == 'dev-test'
	pytz ; extra == 'timezone'
	readme-renderer ; extra == 'dev'
	readme-renderer ; extra == 'dev-docs'
	requests (>=2.16.2) ; extra == 'requests'
	sphinx (<=4.3.2) ; extra == 'dev'
	sphinx (<=4.3.2) ; extra == 'dev-docs'
	sphinx (<=4.3.2) ; extra == 'dev-test'
	sphinx-issues ; extra == 'dev'
	sphinx-issues ; extra == 'dev-docs'
	sphinx-rtd-theme (>=0.5.0) ; extra == 'dev'
	sphinx-rtd-theme (>=0.5.0) ; extra == 'dev-docs'
	urllib3 (>=1.24.2) ; extra == 'requests'
"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev-test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dev-lint? ( >=dev-python/flake8-5.0[${PYTHON_USEDEP}] <dev-python/flake8-5.1[${PYTHON_USEDEP}] )
	>=dev-python/geographiclib-1.52[${PYTHON_USEDEP}] <dev-python/geographiclib-3[${PYTHON_USEDEP}]
	dev-lint? ( >=dev-python/isort-5.10.0[${PYTHON_USEDEP}] <dev-python/isort-5.11.0[${PYTHON_USEDEP}] )
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
