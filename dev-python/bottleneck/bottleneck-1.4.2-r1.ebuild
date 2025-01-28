# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN^}
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Fast NumPy array functions written in C"
HOMEPAGE="
  https://pypi.org/project/bottleneck/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	doc? ( dev-python/gitpython[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-python/numpy-1.9.1:=[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest

src_prepare() {
	# don't overwrites user's optimization level
	sed -e '/extra_compile_args=\["-O2"\]/d' -i setup.py || die

	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=()
	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# GC assumptions?
				tests/memory_test.py::test_memory_leak
			)
			;;
	esac

	rm -rf bottleneck || die
	epytest --pyargs bottleneck
}
