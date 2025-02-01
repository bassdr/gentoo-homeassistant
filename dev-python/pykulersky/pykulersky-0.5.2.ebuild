# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to control Brightech Kuler Sky Bluetooth LED smart lamps"
HOMEPAGE="
  https://pypi.org/project/pykulersky/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/pygatt-4.0.5[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
