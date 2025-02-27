# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Pytest plugin providing a fixture interface for spulec/freezegun"
HOMEPAGE="
  https://pypi.org/project/pytest-freezer/
  Homepage, https://github.com/pytest-dev/pytest-freezer
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	freezegun>=1.1
	pytest>=3.6
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/freezegun-1.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/freezegun-1.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
