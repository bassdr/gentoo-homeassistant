# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="SFR Box API"
HOMEPAGE="
  https://pypi.org/project/sfrbox-api/
  Changelog, https://github.com/hacf-fr/sfrbox-api/releases
  Documentation, https://sfrbox-api.readthedocs.io
  Repository, https://github.com/hacf-fr/sfrbox-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	click>=8.0.1; extra == 'cli'
	defusedxml>=0.7.1
	httpx>=0.23.1
	mashumaro>=3.13.1
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( >=dev-python/click-8.0.1[${PYTHON_USEDEP}] )
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
