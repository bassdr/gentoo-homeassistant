# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="PsychroLib"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} ${PV} .zip)"
S="${WORKDIR}/${PYPI_PN}-${PV}"

DESCRIPTION="Library of psychrometric functions to calculate thermodynamic properties of air"
HOMEPAGE="
  https://pypi.org/project/psychrolib/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
