# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

MY_P=${P/_beta/b}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pylint/"
SRC_URI="
	https://github.com/pylint-dev/pylint/archive/v${PV/_beta/b}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="spelling testutils"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	astroid<=3.4.0-dev0,>=3.3.8
	colorama>=0.4.5; sys_platform == 'win32'
	dill>=0.2; python_version < '3.11'
	dill>=0.3.6; python_version >= '3.11'
	dill>=0.3.7; python_version >= '3.12'
	gitpython>3; extra == 'testutils'
	isort!=5.13.0,<7,>=4.2.5
	mccabe<0.8,>=0.6
	platformdirs>=2.2.0
	pyenchant~=3.2; extra == 'spelling'
	tomli>=1.1.0; python_version < '3.11'
	tomlkit>=0.10.1
	typing-extensions>=3.10.0; python_version < '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/astroid-3.3.8[${PYTHON_USEDEP}] <=dev-python/astroid-3.4.0_pre0[${PYTHON_USEDEP}]
	>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/dill-0.3.7[${PYTHON_USEDEP}]
	testutils? ( >dev-python/gitpython-3[${PYTHON_USEDEP}] )
	>=dev-python/isort-4.2.5[${PYTHON_USEDEP}] <dev-python/isort-7[${PYTHON_USEDEP}] !~dev-python/isort-5.13.0[${PYTHON_USEDEP}]
	>=dev-python/mccabe-0.6[${PYTHON_USEDEP}] <dev-python/mccabe-0.8[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.2.0[${PYTHON_USEDEP}]
	spelling? ( >=dev-python/pyenchant-3.2[${PYTHON_USEDEP}] =dev-python/pyenchant-3*[${PYTHON_USEDEP}] )
	>=dev-python/tomlkit-0.10.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/astroid-3.4[${PYTHON_USEDEP}]
	>=dev-python/astroid-3.3.8[${PYTHON_USEDEP}]
	>=dev-python/dill-0.3.7[${PYTHON_USEDEP}]
	>=dev-python/isort-4.2.5[${PYTHON_USEDEP}]
	<dev-python/isort-6[${PYTHON_USEDEP}]
	>=dev-python/mccabe-0.6[${PYTHON_USEDEP}]
	<dev-python/mccabe-0.8[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.10.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-1.1.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/gitpython-3[${PYTHON_USEDEP}]
		' 'python*' )
		>=dev-python/pytest-8.3[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.12[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		'tests/test_functional.py::test_functional[dataclass_with_field]'
		'tests/test_functional.py::test_functional[no_name_in_module]'
		'tests/test_functional.py::test_functional[shadowed_import]'
		'tests/test_functional.py::test_functional[use_yield_from]'
		'tests/test_functional.py::test_functional[wrong_import_order]'
	)
	local EPYTEST_IGNORE=(
		# No need to run the benchmarks
		tests/benchmark/test_baseline_benchmarks.py
	)

	if ! has_version "dev-python/gitpython[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/profile/test_profile_against_externals.py
			tests/testutils/_primer/test_package_to_lint.py
			tests/testutils/_primer/test_primer.py
		)
	fi

	rm -rf pylint || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p timeout
}

python_install_all() {
	if use examples ; then
		docompress -x "/usr/share/doc/${PF}/examples"
		docinto examples
		dodoc -r examples/.
	fi

	distutils-r1_python_install_all
}
