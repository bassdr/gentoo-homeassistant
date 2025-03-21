# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flit/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	docutils
	flit_core>=3.10.1
	pip
	pygments-github-lexers; extra == 'doc'
	pytest-cov; extra == 'test'
	pytest>=2.7.3; extra == 'test'
	requests
	responses; extra == 'test'
	sphinx; extra == 'doc'
	sphinxcontrib_github_alt; extra == 'doc'
	testpath; extra == 'test'
	tomli-w
	tomli; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/flit-core-3.10.1[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	doc? ( dev-python/pygments-github-lexers[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	dev-python/tomli-w[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/flit-core-${PV}[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tomli-w[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-2.7.3[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND} ${RDEPEND}
	sys-apps/grep
	test? (
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# requires Internet
	tests/test_config.py::test_invalid_classifier
	# failing due to Gentoo pip patches
	tests/test_install.py::InstallTests::test_install_data_dir
	tests/test_install.py::InstallTests::test_install_module_pep621
	tests/test_install.py::InstallTests::test_symlink_data_dir
	tests/test_install.py::InstallTests::test_symlink_module_pep621
)

distutils_enable_tests pytest
distutils_enable_sphinx doc \
	dev-python/sphinxcontrib-github-alt \
	dev-python/pygments-github-lexers \
	dev-python/sphinx-rtd-theme

src_prepare() {
	# make sure system install is used
	rm -r flit_core || die
	distutils-r1_src_prepare
}
