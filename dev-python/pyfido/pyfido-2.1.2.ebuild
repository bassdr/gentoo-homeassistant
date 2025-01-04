# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Get your Fido consumption (wwww.fido.ca)"
HOMEPAGE="
  https://pypi.org/project/pyfido/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.rst"
GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]"
