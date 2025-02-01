# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python implementation of Aurora Protocol"
HOMEPAGE="
  https://pypi.org/project/aurorapy/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/future-0.16.0[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.2.1[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pyserial[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
