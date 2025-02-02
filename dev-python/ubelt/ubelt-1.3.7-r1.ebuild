# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ubelt/"
SRC_URI="
	https://github.com/Erotemic/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all all-strict docs docs-strict optional optional-strict tests-strict types types-strict"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	types-strict? ( ~dev-python/autoflake-1.4[${PYTHON_USEDEP}] )
	types? ( >=dev-python/autoflake-1.4[${PYTHON_USEDEP}] )
	~dev-python/coverage-5.3.1[${PYTHON_USEDEP}]
	~dev-python/coverage-6.1.1[${PYTHON_USEDEP}]
	~dev-python/coverage-7.3.0[${PYTHON_USEDEP}]
	>=dev-python/coverage-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/coverage-6.1.1[${PYTHON_USEDEP}]
	>=dev-python/coverage-7.3.0[${PYTHON_USEDEP}]
	types-strict? ( dev-python/mypy[${PYTHON_USEDEP}] )
	types? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	~dev-python/numpy-1.19.2[${PYTHON_USEDEP}]
	~dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
	~dev-python/numpy-1.21.1[${PYTHON_USEDEP}]
	~dev-python/numpy-1.23.2[${PYTHON_USEDEP}]
	~dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	<dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.21.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/packaging-21.0[${PYTHON_USEDEP}] )
	<dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	~dev-python/pygments-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.13.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/pygments-2.2.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]' python3_12)
	docs-strict? ( ~dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	~dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/pytest-timeout-1.4.2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/pytest-timeout-1.4.2[${PYTHON_USEDEP}]' python3_12)
	all-strict? ( ~dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/requests-2.25.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.3.2[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	tests-strict? ( ~dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}] )
	~dev-python/xxhash-1.3.0[${PYTHON_USEDEP}]
	~dev-python/xxhash-1.4.3[${PYTHON_USEDEP}]
	~dev-python/xxhash-2.0.2[${PYTHON_USEDEP}]
	~dev-python/xxhash-3.0.0[${PYTHON_USEDEP}]
	~dev-python/xxhash-3.2.0[${PYTHON_USEDEP}]
	~dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]
	~dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/xxhash-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.5.0[${PYTHON_USEDEP}]
	types-strict? ( ~dev-python/yapf-0.32.0[${PYTHON_USEDEP}] )
	types? ( >=dev-python/yapf-0.32.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		>=dev-python/numpy-1.19.2[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
		dev-python/xdoctest[${PYTHON_USEDEP}]
		>=dev-python/xxhash-1.0.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	>=dev-python/xdoctest-1.1.5[${PYTHON_USEDEP}]
)"

EPYTEST_DESELECT=(
	tests/test_editable_modules.py::test_import_of_editable_install
	# relies on passwd home being equal to ${HOME}
	ubelt/util_path.py::userhome:0
)

EPYTEST_IGNORE=(
	# asserts for running on win32 in global scope
	ubelt/_win32_jaraco.py
)
# RDEPEND could not be inserted in this ebuild
