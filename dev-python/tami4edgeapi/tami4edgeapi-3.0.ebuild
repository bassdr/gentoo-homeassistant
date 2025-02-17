# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tami4edgeapi/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	pyjwt
	pypasser
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pypasser[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
