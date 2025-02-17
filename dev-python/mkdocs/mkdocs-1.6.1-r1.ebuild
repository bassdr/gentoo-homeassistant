# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs/"
SRC_URI="
	https://github.com/mkdocs/mkdocs/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="i18n min-versions"
IUSE="${GENERATED_IUSE} doc"


REQUIRES_DIST="
	babel==2.9.0; extra == 'min-versions'
	babel>=2.9.0; extra == 'i18n'
	click==7.0; extra == 'min-versions'
	click>=7.0
	colorama==0.4; platform_system == 'Windows' and extra == 'min-versions'
	colorama>=0.4; platform_system == 'Windows'
	ghp-import==1.0; extra == 'min-versions'
	ghp-import>=1.0
	importlib-metadata==4.4; python_version < '3.10' and extra == 'min-versions'
	importlib-metadata>=4.4; python_version < '3.10'
	jinja2==2.11.1; extra == 'min-versions'
	jinja2>=2.11.1
	markdown==3.3.6; extra == 'min-versions'
	markdown>=3.3.6
	markupsafe==2.0.1; extra == 'min-versions'
	markupsafe>=2.0.1
	mergedeep==1.3.4; extra == 'min-versions'
	mergedeep>=1.3.4
	mkdocs-get-deps==0.2.0; extra == 'min-versions'
	mkdocs-get-deps>=0.2.0
	packaging==20.5; extra == 'min-versions'
	packaging>=20.5
	pathspec==0.11.1; extra == 'min-versions'
	pathspec>=0.11.1
	pyyaml-env-tag==0.1; extra == 'min-versions'
	pyyaml-env-tag>=0.1
	pyyaml==5.1; extra == 'min-versions'
	pyyaml>=5.1
	watchdog==2.0; extra == 'min-versions'
	watchdog>=2.0
"
GENERATED_RDEPEND="${RDEPEND}
	i18n? ( >=dev-python/babel-2.9.0[${PYTHON_USEDEP}] )
	min-versions? ( ~dev-python/babel-2.9.0[${PYTHON_USEDEP}] )
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/click-7.0[${PYTHON_USEDEP}] )
	>=dev-python/ghp-import-1.0[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/ghp-import-1.0[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.11.1[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/jinja2-2.11.1[${PYTHON_USEDEP}] )
	>=dev-python/markdown-3.3.6[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/markdown-3.3.6[${PYTHON_USEDEP}] )
	>=dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}] )
	>=dev-python/mergedeep-1.3.4[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/mergedeep-1.3.4[${PYTHON_USEDEP}] )
	>=dev-python/mkdocs-get-deps-0.2.0[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/mkdocs-get-deps-0.2.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.5[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/packaging-20.5[${PYTHON_USEDEP}] )
	>=dev-python/pathspec-0.11.1[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/pathspec-0.11.1[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-env-tag-0.1[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/pyyaml-env-tag-0.1[${PYTHON_USEDEP}] )
	>=dev-python/watchdog-2.0[${PYTHON_USEDEP}]
	min-versions? ( ~dev-python/watchdog-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/babel-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.3.6[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/watchdog-2.0[${PYTHON_USEDEP}]
	>=dev-python/ghp-import-1.0[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-env-tag-0.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.5[${PYTHON_USEDEP}]
	>=dev-python/mergedeep-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-get-deps-0.2.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Tests fails if additional themes are installed
	mkdocs/tests/utils/utils_tests.py::UtilsTests::test_get_themes
	mkdocs/tests/utils/utils_tests.py::UtilsTests::test_get_themes_error
	mkdocs/tests/utils/utils_tests.py::UtilsTests::test_get_themes_warning

	# Does not work in emerge env
	mkdocs/tests/config/config_options_tests.py::ListOfPathsTest::test_paths_localized_to_config

	# TODO
	mkdocs/tests/build_tests.py::testing_server
	mkdocs/tests/livereload_tests.py::testing_server
)

python_compile_all() {
	default
}

python_test() {
	epytest '-opython_files=*tests.py' mkdocs/tests
}
