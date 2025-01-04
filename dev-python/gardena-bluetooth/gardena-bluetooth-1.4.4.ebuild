# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gardena-bluetooth/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.0.1[${PYTHON_USEDEP}]"
