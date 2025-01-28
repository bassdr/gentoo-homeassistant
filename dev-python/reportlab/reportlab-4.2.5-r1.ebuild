# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/reportlab/"
SRC_URI+="
	https://www.reportlab.com/ftp/fonts/pfbfer-20070710.zip
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="accel pycairo renderpm"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev-python/chardet[${PYTHON_USEDEP}]
	pycairo? ( <dev-python/freetype-py-2.4[${PYTHON_USEDEP}] )
	>=dev-python/pillow-9.0.0[${PYTHON_USEDEP}]
	accel? ( <dev-python/rl-accel-1.1[${PYTHON_USEDEP}] )
	renderpm? ( <dev-python/rl-renderpm-4.1[${PYTHON_USEDEP}] )
	pycairo? ( <dev-python/rlpycairo-1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/pillow[tiff,truetype,jpeg(+),${PYTHON_USEDEP}]
"
BDEPEND="
	app-arch/unzip
"

distutils_enable_sphinx docs/source

src_unpack() {
	unpack ${P}.tar.gz
	cd ${P}/src/reportlab/fonts || die
	unpack pfbfer-20070710.zip
}

src_configure() {
	cat > local-setup.cfg <<-EOF || die
		[OPTIONS]
		no-download-t1-files = 1
	EOF
}

python_test() {
	pushd tests >/dev/null || die
	"${EPYTHON}" runAll.py --post-install --verbosity=2 ||
		die "Testing failed with ${EPYTHON}"
	popd >/dev/null || die
}
