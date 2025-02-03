# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Fast numerical expression evaluator for NumPy"
HOMEPAGE="
  https://pypi.org/project/numexpr/
  homepage, https://github.com/pydata/numexpr
  documentation, https://numexpr.readthedocs.io
  repository, https://github.com/pydata/numexpr
"
SRC_URI="https://github.com/pydata/numexpr/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
DEPEND="
	>=dev-python/numpy-2.0.0_rc:=[${PYTHON_USEDEP}]
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.23.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
"

src_prepare() {
	# broken with > 8 CPU threads?
	# https://github.com/pydata/numexpr/issues/490
	sed -e 's:test_max_threads_unset:_&:' \
		-i numexpr/tests/test_numexpr.py || die

	distutils-r1_src_prepare
}

python_test() {
	pushd "${BUILD_DIR}/install/$(python_get_sitedir)" >/dev/null || die
	"${EPYTHON}" - <<-EOF || die "Tests failed with ${EPYTHON}"
		import sys,numexpr
		sys.exit(0 if numexpr.test(verbosity=2).wasSuccessful() else 1)
	EOF
	pushd >/dev/null || die
}
