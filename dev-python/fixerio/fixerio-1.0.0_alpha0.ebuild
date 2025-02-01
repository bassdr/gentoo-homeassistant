# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "fixerio" "1.0.0a0")"
S="${WORKDIR}/fixerio-1.0.0a0"

MY_PV=${PV/_alpha/a}
DESCRIPTION="A Python client for Fixer.io"
HOMEPAGE="
  https://pypi.org/project/fixerio/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"


python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
