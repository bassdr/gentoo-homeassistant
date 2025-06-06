# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mpi4py/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="doc examples test"

RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	virtual/mpi
"
DEPEND="${RDEPEND}
	test? (
		virtual/mpi[romio]
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-3.1.5-test_memory.testReadOnly.patch"
)

python_prepare_all() {
	# not needed on install
	rm -vr docs/source || die
	rm test/test_pickle.py || die # disabled by Gentoo-bug #659348
	distutils-r1_python_prepare_all
}

python_test() {
	echo "Beginning test phase"
	local -x PYTHONPATH="${BUILD_DIR}/install$(python_get_sitedir)"

	# python want's all arguments as separate strings
	local mpi_opts=(
		"-n" "1"
	)
	# spawn is not stable in OpenMPI 4
	# https://github.com/jsquyres/ompi/pull/4#issuecomment-806897758
	# oob_tcp_if_include lo is needed to allow test in systemd-nspawn container
	has_version sys-cluster/openmpi && mpi_opts+=(
		"--use-hwthread-cpus"
		"--mca" "btl" "tcp,self"
		"--mca" "oob_tcp_if_include" "lo"
	)
	mpiexec \
		"${mpi_opts[@]}" \
		"${PYTHON}" -B -v ./test/runtests.py -v \
		--exclude="test_msgspec" --exclude="test_spawn" ||
		die "Testsuite failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )
	use examples && local DOCS=( demo )
	distutils-r1_python_install_all
}
