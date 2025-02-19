# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all download install"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pbs-installer/"

SRC_URI="
	https://github.com/frostming/pbs-installer/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	httpx<1,>=0.27.0; extra == 'download'
	pbs-installer[download,install]; extra == 'all'
	zstandard>=0.21.0; extra == 'install'
"
GENERATED_RDEPEND="${RDEPEND}
	download? ( >=dev-python/httpx-0.27.0[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}] )
	all? ( dev-python/pbs-installer[download,install,${PYTHON_USEDEP}] )
	install? ( >=dev-python/zstandard-0.21.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	dev-python/zstandard[${PYTHON_USEDEP}]
"

# upstream does not provide any tests
RESTRICT=test

python_configure_all() {
	export PDM_BUILD_SCM_VERSION=${PV}
}
