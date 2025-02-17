# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scikit-build/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	build (>=0.7) ; extra == 'test'
	codecov (>=2.0.5) ; extra == 'test'
	coverage (>=4.2) ; extra == 'test'
	cython (>=0.25.1) ; extra == 'test'
	distro
	flake8 (>=3.0.4) ; extra == 'test'
	packaging
	path.py (>=11.5.0) ; extra == 'test'
	pygments ; extra == 'docs'
	pytest (<7.2.0,>=6.0.0) ; extra == 'test'
	pytest-cov (>=2.7.1) ; extra == 'test'
	pytest-mock (>=1.10.4) ; extra == 'test'
	pytest-runner (>=5.1) ; extra == 'test'
	pytest-virtualenv (>=1.2.5) ; extra == 'test'
	requests ; extra == 'test'
	setuptools (>=42.0.0)
	sphinx (>=4) ; extra == 'docs'
	sphinx-issues ; extra == 'docs'
	sphinx-rtd-theme (>=1.0) ; extra == 'docs'
	sphinxcontrib-moderncmakedomain (>=3.19) ; extra == 'docs'
	typing-extensions (>=3.7) ; python_version < '3.8'
	ubelt (>=0.8.2) ; extra == 'test'
	virtualenv ; extra == 'test'
	wheel (>=0.32.0)
	xdoctest (>=0.10.0) ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	docs? ( dev-python/pygments[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-42.0.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-issues[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-moderncmakedomain-3.19[${PYTHON_USEDEP}] )
	>=dev-python/wheel-0.32.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/build-0.7[${PYTHON_USEDEP}]
		>=dev-python/codecov-2.0.5[${PYTHON_USEDEP}]
		>=dev-python/coverage-4.2[${PYTHON_USEDEP}]
		>=dev-python/cython-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/flake8-3.0.4[${PYTHON_USEDEP}]
		>=dev-python/path-py-11.5.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}] <dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.7.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-1.10.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-runner-5.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-virtualenv-1.2.5[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/ubelt-0.8.2[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		>=dev-python/xdoctest-0.10.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
