# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Waze client for calculating routes and travel times."
HOMEPAGE="
  https://pypi.org/project/pywaze/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx>=0.24.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
