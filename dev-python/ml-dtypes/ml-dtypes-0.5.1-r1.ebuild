# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}
EIGEN_CommitId="7bf2968fed5f246c0589e1111004cb420fcd7c71"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ml-dtypes/"
SRC_URI="
	https://github.com/jax-ml/ml_dtypes/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
	https://gitlab.com/libeigen/eigen/-/archive/${EIGEN_CommitId}/eigen-${EIGEN_CommitId}.tar.bz2
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	>=dev-python/numpy-1.21:=[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	absl-py; extra == 'dev'
	numpy>=1.21
	numpy>=1.21.2; python_version >= '3.10'
	numpy>=1.23.3; python_version >= '3.11'
	numpy>=1.26.0; python_version >= '3.12'
	numpy>=2.1.0; python_version >= '3.13'
	pyink; extra == 'dev'
	pylint>=2.6.0; extra == 'dev'
	pytest-xdist; extra == 'dev'
	pytest; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.21.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.21[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t})
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/pyink[${PYTHON_USEDEP}]
		>=dev-python/pylint-2.6.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/pybind11[${PYTHON_USEDEP}]
	test? (
		dev-python/absl-py[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	rmdir third_party/eigen || die
	mv "${WORKDIR}/eigen-${EIGEN_CommitId}" third_party/eigen || die
	distutils-r1_python_prepare_all
}

src_test() {
	mv ml_dtypes/tests . || die
	rm -r ml_dtypes || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	distutils-r1_src_test
}
