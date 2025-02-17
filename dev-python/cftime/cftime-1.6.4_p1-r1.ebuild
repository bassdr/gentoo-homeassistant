# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 1.6.4.post1)"
S="${WORKDIR}/${PN}-1.6.4.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cftime/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	numpy>1.13.3; python_version < '3.12.0.rc1'
	numpy>=1.26.0b1; python_version >= '3.12.0.rc1'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.26.0_beta1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	>=dev-python/cython-0.29.20[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	# remove pytest-cov dep
	sed -e "/--cov/d" -i setup.cfg || die

	distutils-r1_python_prepare_all
}
