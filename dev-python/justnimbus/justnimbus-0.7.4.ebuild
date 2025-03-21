# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Python Wrapper for the Just Nimbus API"
HOMEPAGE="
  https://pypi.org/project/justnimbus/
  Repository, https://github.com/kvanzuijlen/justnimbus
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	requests<3.0.0,>=2.27.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.27.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
