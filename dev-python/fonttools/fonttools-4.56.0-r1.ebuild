# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fonttools/"
SRC_URI="
	https://github.com/fonttools/fonttools/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all graphite interpolatable lxml pathops plot repacker symfont ufo unicode woff"
IUSE="${GENERATED_IUSE} +native-extensions"

REQUIRES_DIST="
	brotli>=1.0.1; platform_python_implementation == 'CPython' and extra == 'all'
	brotli>=1.0.1; platform_python_implementation == 'CPython' and extra == 'woff'
	brotlicffi>=0.8.0; platform_python_implementation != 'CPython' and extra == 'all'
	brotlicffi>=0.8.0; platform_python_implementation != 'CPython' and extra == 'woff'
	fs<3,>=2.2.0; extra == 'all'
	fs<3,>=2.2.0; extra == 'ufo'
	lxml>=4.0; extra == 'all'
	lxml>=4.0; extra == 'lxml'
	lz4>=1.7.4.2; extra == 'all'
	lz4>=1.7.4.2; extra == 'graphite'
	matplotlib; extra == 'all'
	matplotlib; extra == 'plot'
	munkres; platform_python_implementation == 'PyPy' and extra == 'all'
	munkres; platform_python_implementation == 'PyPy' and extra == 'interpolatable'
	pycairo; extra == 'all'
	pycairo; extra == 'interpolatable'
	scipy; platform_python_implementation != 'PyPy' and extra == 'all'
	scipy; platform_python_implementation != 'PyPy' and extra == 'interpolatable'
	skia-pathops>=0.5.0; extra == 'all'
	skia-pathops>=0.5.0; extra == 'pathops'
	sympy; extra == 'all'
	sympy; extra == 'symfont'
	uharfbuzz>=0.23.0; extra == 'all'
	uharfbuzz>=0.23.0; extra == 'repacker'
	unicodedata2>=15.1.0; python_version <= '3.12' and extra == 'all'
	unicodedata2>=15.1.0; python_version <= '3.12' and extra == 'unicode'
	xattr; sys_platform == 'darwin' and extra == 'all'
	xattr; sys_platform == 'darwin' and extra == 'type1'
	zopfli>=0.1.4; extra == 'all'
	zopfli>=0.1.4; extra == 'woff'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=app-arch/brotli-1.0.1[python,${PYTHON_USEDEP}] )
	woff? ( >=app-arch/brotli-1.0.1[python,${PYTHON_USEDEP}] )
	all? ( >=dev-python/fs-2.2.0[${PYTHON_USEDEP}] <dev-python/fs-3[${PYTHON_USEDEP}] )
	ufo? ( >=dev-python/fs-2.2.0[${PYTHON_USEDEP}] <dev-python/fs-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/lxml-4.0[${PYTHON_USEDEP}] )
	lxml? ( >=dev-python/lxml-4.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/lz4-1.7.4.2[${PYTHON_USEDEP}] )
	graphite? ( >=dev-python/lz4-1.7.4.2[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	plot? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	all? ( dev-python/pycairo[${PYTHON_USEDEP}] )
	interpolatable? ( dev-python/pycairo[${PYTHON_USEDEP}] )
	all? ( dev-python/scipy[${PYTHON_USEDEP}] )
	interpolatable? ( dev-python/scipy[${PYTHON_USEDEP}] )
	all? ( >=dev-python/skia-pathops-0.5.0[${PYTHON_USEDEP}] )
	pathops? ( >=dev-python/skia-pathops-0.5.0[${PYTHON_USEDEP}] )
	all? ( dev-python/sympy[${PYTHON_USEDEP}] )
	symfont? ( dev-python/sympy[${PYTHON_USEDEP}] )
	all? ( >=dev-python/uharfbuzz-0.23.0[${PYTHON_USEDEP}] )
	repacker? ( >=dev-python/uharfbuzz-0.23.0[${PYTHON_USEDEP}] )
	all? ( $(python_gen_cond_dep '>=dev-python/unicodedata2-15.1.0[${PYTHON_USEDEP}]' python3_12) )
	unicode? ( $(python_gen_cond_dep '>=dev-python/unicodedata2-15.1.0[${PYTHON_USEDEP}]' python3_12) )
	all? ( >=dev-python/zopfli-0.1.4[${PYTHON_USEDEP}] )
	woff? ( >=dev-python/zopfli-0.1.4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/fs-2.4.9[${PYTHON_USEDEP}]
"
BDEPEND="
	native-extensions? (
		$(python_gen_cond_dep '
			dev-python/cython[${PYTHON_USEDEP}]
		' 'python*')
	)
	test? (
		dev-python/brotlicffi[${PYTHON_USEDEP}]
		dev-python/munkres[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		app-arch/zopfli
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	# When dev-python/pytest-shutil is installed, we get weird import errors.
	# This is due to incomplete nesting in the Tests/ tree:
	#
	#   Tests/feaLib/__init__.py
	#   Tests/ufoLib/__init__.py
	#   Tests/svgLib/path/__init__.py
	#   Tests/otlLib/__init__.py
	#   Tests/varLib/__init__.py
	#
	# This tree requires an __init__.py in Tests/svgLib/ too, bug #701148.
	touch Tests/svgLib/__init__.py || die

	distutils-r1_python_prepare_all
}

python_compile() {
	local -x FONTTOOLS_WITH_CYTHON=$(usex native-extensions)
	[[ ${EPYTHON} == pypy3 ]] && FONTTOOLS_WITH_CYTHON=0
	distutils-r1_python_compile
}

src_test() {
	# virtualx used when matplotlib is installed causing plot module tests to run
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# flaky test
		Tests/ttLib/woff2_test.py::WOFF2ReaderTest::test_get_normal_tables
	)

	if [[ ${EPYTHON} == pypy3 ]] &&
		has_version "dev-python/pyxattr[${PYTHON_USEDEP}]" &&
		{
			has_version "<dev-python/pypy3_10-exe-7.3.13_p2" ||
			has_version "<dev-python/pypy3_10-exe-bin-7.3.13_p2"
		}
	then
		EPYTEST_DESELECT+=(
			# affected by a bug in PyPy/pyxattr
			# https://github.com/iustin/pyxattr/issues/41
			Tests/t1Lib/t1Lib_test.py::ReadWriteTest::test_read_with_path
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	nonfatal epytest \
		-p rerunfailures --reruns=5 \
		Tests fontTools || die -n "Tests failed with ${EPYTHON}"
}
