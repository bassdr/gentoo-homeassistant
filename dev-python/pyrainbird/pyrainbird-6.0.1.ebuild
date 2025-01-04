# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Rain Bird Controller"
HOMEPAGE="
  https://pypi.org/project/pyrainbird/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp-retry[${PYTHON_USEDEP}]
	dev-python/ical[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pycryptodome-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/ical-4.2.9[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.8.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
