# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=PyOpenGL
PYTHON_REQ_USE="tk?"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi virtualx

DESCRIPTION="Python OpenGL bindings"
HOMEPAGE="
	https://pyopengl.sourceforge.net/
	https://github.com/mcfletch/pyopengl/
	https://pypi.org/project/PyOpenGL/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="tk"

RDEPEND="
	media-libs/freeglut
	virtual/opengl
	x11-libs/libXi
	x11-libs/libXmu
	tk? ( dev-tcltk/togl )
"
DEPEND="
	${RDEPEND}
"

# The tests need an X server with the GLX extension. Software rendering
# under Xvfb works but only with llvmpipe, not softpipe or swr.
BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pygame[${PYTHON_USEDEP},opengl,X]
		dev-python/python-xlib[${PYTHON_USEDEP}]
		!prefix? (
			media-libs/mesa[llvm]
			x11-base/xorg-server[-minimal,xorg]
		)
	)
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/mcfletch/pyopengl/pull/109
	"${FILESDIR}/${PN}-3.1.7-pypy3.patch"
)

python_test() {
	local EPYTEST_DESELECT=(
		# fragile memory tests
		tests/test_checks.py::test_test_glgetfloat_leak
		tests/test_vbo_memusage.py::test_sf_2980896
		# missing EGL stuffs?
		tests/test_checks.py::test_check_egl_es2
		tests/test_checks.py::test_egl_ext_enumerate
	)
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

	nonfatal epytest tests || die "Tests failed with ${EPYTHON}"
}

src_test() {
	virtx distutils-r1_src_test
}
