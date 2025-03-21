# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

MY_PN=${PN//-/_}
MY_PN=${MY_PN/_/-}

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-custom-exit-code/"

SRC_URI="https://github.com/yashtodi94/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pytest (>=4.0.2)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-4.0.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-7.0.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
	)
"

distutils_enable_tests pytest

python_test() {
	epytest tests
}
