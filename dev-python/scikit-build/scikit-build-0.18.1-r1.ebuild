# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scikit-build/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cov docs doctest"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	cov? ( >=dev-python/coverage-4.2[toml,${PYTHON_USEDEP}] )
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	docs? ( dev-python/pygments[${PYTHON_USEDEP}] )
	cov? ( >=dev-python/pytest-cov-2.7.1[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-42.0.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-issues[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-moderncmakedomain-3.19[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7[${PYTHON_USEDEP}]
	doctest? ( >=dev-python/ubelt-0.8.2[${PYTHON_USEDEP}] )
	>=dev-python/wheel-0.32.0[${PYTHON_USEDEP}]
	doctest? ( >=dev-python/xdoctest-0.10.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/setuptools-42.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
	>=dev-python/wheel-0.32.0[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/build-0.7[${PYTHON_USEDEP}]
		>=dev-python/cython-0.25.1[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-1.10.4[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme \
	dev-python/sphinx-issues
# note: tests are unstable with xdist
distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/build-0.7[${PYTHON_USEDEP}]
	>=dev-python/cython-0.25.1[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-1.10.4[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
)"

src_prepare() {
	# not packaged
	sed -i -e '/cmakedomain/d' docs/conf.py || die
	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# no "library" in (our install of) pypy3
				tests/test_cmaker.py::test_get_python_library
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock \
		-m "not isolated and not nosetuptoolsscm" \
		-o tmp_path_retention_count=1
	rm -r "${BUILD_DIR}/install$(python_get_sitedir)"/{easy-install.pth,*.egg,*.egg-link} || die
}
