# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library for getting historical and forecasted usage/cost from utilities that use opower.com such as PG&E"
HOMEPAGE="
  https://pypi.org/project/opower/
  Homepage, https://github.com/tronikos/opower
  Bug Tracker, https://github.com/tronikos/opower/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.8
	aiozoneinfo>=0.1
	arrow>=1.2
	cryptography>=43.0.0
	pyotp>=2.0
	pytest<8,>=7; extra == "dev"
	python-dotenv<2,>=1; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.1[${PYTHON_USEDEP}]
	>=dev-python/arrow-1.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.1[${PYTHON_USEDEP}]
	>=dev-python/arrow-1.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1[${PYTHON_USEDEP}] <dev-python/python-dotenv-2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
