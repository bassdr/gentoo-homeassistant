# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# sphinx-theme-builder is completely unusable, as it requires pinning
# to a very-specific nodejs version number, and ofc loves fetching
# everything from the Internet

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A clean customisable Sphinx documentation theme."
HOMEPAGE="
  https://pypi.org/project/furo/
  Github, https://github.com/pradyunsg/furo
"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.7[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	<dev-python/sphinx-9.0[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	>=dev-python/sphinx-basic-ng-1.0.0.bet_alpha2[${PYTHON_USEDEP}]
	dev-python/sphinx-basic-ng[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/sphinx-basic-ng[${PYTHON_USEDEP}]
"

src_unpack() {
	if [[ ${PKGBUMPING} == ${PVR} ]]; then
		unzip "${DISTDIR}/${A}" || die
	fi
}

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${P}-py3-none-any.whl"
}
