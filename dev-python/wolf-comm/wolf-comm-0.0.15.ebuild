# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to communicate with Wolf SmartSet Cloud"
HOMEPAGE="
  https://pypi.org/project/wolf-comm/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx
	lxml
	pkce
	shortuuid
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pkce[${PYTHON_USEDEP}]
	dev-python/shortuuid[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pkce[${PYTHON_USEDEP}]
	dev-python/shortuuid[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
