# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Home Assistant helper lib for the IKEA Idasen Desk integration"
HOMEPAGE="
  https://pypi.org/project/idasen-ha/
  Homepage, https://github.com/abmantis/idasen-ha/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	idasen<=0.12.0,>=0.10
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/idasen-0.10[${PYTHON_USEDEP}] <=dev-python/idasen-0.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/idasen-0.10[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
