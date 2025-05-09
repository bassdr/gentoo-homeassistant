# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="anel_pwrctrl-homeassistant"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} 0.0.1.dev2)"
S="${WORKDIR}/${PYPI_PN}-0.0.1.dev2"

MY_PN=${PN/-/_}
DESCRIPTION="Discover and control ANEL NET-PwrCtrl devices."
HOMEPAGE="
  https://pypi.org/project/anel-pwrctrl-homeassistant/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"


python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
