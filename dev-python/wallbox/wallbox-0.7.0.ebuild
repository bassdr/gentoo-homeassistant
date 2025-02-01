# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Module for interacting with Wallbox EV charger api"
HOMEPAGE="
  https://pypi.org/project/wallbox/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aenum-3.1.8[${PYTHON_USEDEP}]
	dev-python/aenum[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.16.0[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/aenum-3.1.8[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
