# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to access meteorological data from Environment Canada"
HOMEPAGE="
  https://pypi.org/project/env-canada/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Pillow>=10.0.1
	aiohttp>=3.9.0
	defusedxml
	geopy
	imageio>=2.28.0
	lxml
	numpy>=1.22.2
	pandas>=1.3.0
	python-dateutil
	voluptuous
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.28.0[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
	dev-python/imageio[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
