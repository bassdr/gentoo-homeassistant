# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
# setuptools wrapper
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE='tk?,threads(+)'

inherit distutils-r1 toolchain-funcs virtualx

MY_PN=Pillow
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python Imaging Library (Fork)"
HOMEPAGE="
  https://pypi.org/project/pillow/
  Changelog, https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst
  Documentation, https://pillow.readthedocs.io
  Funding, https://tidelift.com/subscription/pkg/pypi-pillow?utm_source=pypi-pillow&utm_medium=pypi
  Homepage, https://python-pillow.org
  Mastodon, https://fosstodon.org/@pillow
  Release notes, https://pillow.readthedocs.io/en/stable/releasenotes/index.html
  Source, https://github.com/python-pillow/Pillow
"
SRC_URI="
	https://github.com/python-pillow/Pillow/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="HPND"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs fpx mic tests xmp"
IUSE="${GENERATED_IUSE} examples imagequant +jpeg jpeg2k lcms test tiff tk truetype webp xcb zlib"
REQUIRED_USE="test? ( jpeg jpeg2k lcms tiff truetype )"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	tests? ( dev-python/coverage[${PYTHON_USEDEP}] )
	tests? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	xmp? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	tests? ( dev-python/markdown2[${PYTHON_USEDEP}] )
	docs? ( dev-python/olefile[${PYTHON_USEDEP}] )
	fpx? ( dev-python/olefile[${PYTHON_USEDEP}] )
	mic? ( dev-python/olefile[${PYTHON_USEDEP}] )
	tests? ( dev-python/olefile[${PYTHON_USEDEP}] )
	tests? ( dev-python/packaging[${PYTHON_USEDEP}] )
	tests? ( dev-python/pyroma[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.4[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-removed-in[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxext-opengraph[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
DEPEND="
	imagequant? ( media-gfx/libimagequant:= )
	jpeg? ( media-libs/libjpeg-turbo:= )
	jpeg2k? ( media-libs/openjpeg:2= )
	lcms? ( media-libs/lcms:2= )
	tiff? ( media-libs/tiff:=[jpeg,zlib] )
	truetype? ( media-libs/freetype:2= )
	webp? ( media-libs/libwebp:= )
	xcb? ( x11-libs/libxcb )
	zlib? ( sys-libs/zlib:= )
"
RDEPEND="
	${DEPEND}
	dev-python/olefile[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	virtual/pkgconfig
	test? (
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		|| (
			media-gfx/imagemagick[png]
			media-gfx/graphicsmagick[png]
		)
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

PATCHES=(
	# https://github.com/python-pillow/pillow/pull/7634
	"${FILESDIR}/${PN}-10.2.0-cross.patch"
)

usepil() {
	usex "${1}" enable disable
}

python_configure_all() {
	cat >> setup.cfg <<-EOF || die
		[build_ext]
		debug = True
		disable_platform_guessing = True
		$(usepil truetype)_freetype = True
		$(usepil jpeg)_jpeg = True
		$(usepil jpeg2k)_jpeg2000 = True
		$(usepil lcms)_lcms = True
		$(usepil tiff)_tiff = True
		$(usepil imagequant)_imagequant = True
		$(usepil webp)_webp = True
		$(usepil xcb)_xcb = True
		$(usepil zlib)_zlib = True
	EOF
	if use truetype; then
		# these dependencies are implicitly disabled by USE=-truetype
		# and we can't pass both disable_* and vendor_*
		# https://bugs.gentoo.org/935124
		cat >> setup.cfg <<-EOF || die
			vendor_raqm = False
			vendor_fribidi = False
		EOF
	fi

	tc-export PKG_CONFIG
}

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# TODO (is clipboard unreliable in Xvfb?)
		Tests/test_imagegrab.py::TestImageGrab::test_grabclipboard
		# requires xz-utils[extra-filters]?
		Tests/test_file_libtiff.py::TestFileLibTiff::test_lzma
	)

	case ${ARCH} in
		ppc)
			EPYTEST_DESELECT+=(
				# https://github.com/python-pillow/Pillow/issues/7008
				# (we've reverted the upstream patch because it was worse
				# than the original issue)
				Tests/test_file_libtiff.py::TestFileLibTiff::test_exif_ifd
			)
			;;
	esac

	"${EPYTHON}" selftest.py --installed || die "selftest failed with ${EPYTHON}"
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# leak tests are fragile and broken under xdist
	epytest -k "not leak" -p timeout || die "Tests failed with ${EPYTHON}"
}

python_install() {
	python_doheader src/libImaging/*.h
	distutils-r1_python_install
}

python_install_all() {
	if use examples ; then
		docinto example
		dodoc docs/example/*
		docompress -x /usr/share/doc/${PF}/example
	fi
	distutils-r1_python_install_all
}
