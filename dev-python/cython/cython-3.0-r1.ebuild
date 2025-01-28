# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_TESTED=( python3_{10..12} )
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 multiprocessing toolchain-funcs

MY_P=${P/_rc/rc}
DESCRIPTION="The Cython compiler for writing C extensions in the Python language."
HOMEPAGE="
  https://pypi.org/project/Cython/
  Documentation, https://cython.readthedocs.io/
  Donate, https://cython.readthedocs.io/en/latest/src/donating.html
  Source Code, https://github.com/cython/cython
  Bug Tracker, https://github.com/cython/cython/issues
  User Group, https://groups.google.com/g/cython-users
"
SRC_URI="
	https://github.com/cython/cython/archive/${PV/_rc/rc}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	${RDEPEND}
	test? (
		$(python_gen_cond_dep '
			<dev-python/numpy-2[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-0.29.22-spawn-multiprocessing.patch"
	"${FILESDIR}/${PN}-0.29.23-test_exceptions-py310.patch"
	"${FILESDIR}/${PN}-0.29.23-pythran-parallel-install.patch"
)

distutils_enable_sphinx docs \
	dev-python/jinja2 \
	dev-python/sphinx-issues \
	dev-python/sphinx-tabs

python_compile() {
	# Python gets confused when it is in sys.path before build.
	local -x PYTHONPATH=

	distutils-r1_python_compile
}

python_test() {
	if ! has "${EPYTHON/./_}" "${PYTHON_TESTED[@]}"; then
		einfo "Skipping tests on ${EPYTHON} (xfail)"
		return
	fi

	# Needed to avoid confusing cache tests
	unset CYTHON_FORCE_REGEN

	tc-export CC
	# https://github.com/cython/cython/issues/1911
	local -x CFLAGS="${CFLAGS} -fno-strict-overflow"
	"${PYTHON}" runtests.py \
		-vv \
		-j "$(makeopts_jobs)" \
		--work-dir "${BUILD_DIR}"/tests \
		--no-examples \
		--no-code-style \
		|| die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	local DOCS=( CHANGES.rst README.rst ToDo.txt USAGE.txt )
	distutils-r1_python_install_all
}
# PYPI_PN could not be inserted in this ebuild
