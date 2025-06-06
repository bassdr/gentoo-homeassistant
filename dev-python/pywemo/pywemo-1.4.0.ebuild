# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Lightweight Python module to discover and control WeMo devices"
HOMEPAGE="
  https://pypi.org/project/pywemo/
  Repository, https://github.com/pywemo/pywemo
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	ifaddr (>=0.1.0)
	lxml (>=4.6)
	requests (>=2.0)
	urllib3 (>=1.26.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/ifaddr-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/ifaddr-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
