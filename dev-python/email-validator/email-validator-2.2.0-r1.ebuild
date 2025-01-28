# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=email-validator
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/email-validator/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/dnspython-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/idna-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	epytest -m "not network"
}
