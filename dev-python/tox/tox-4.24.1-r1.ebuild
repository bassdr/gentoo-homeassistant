# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tox/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cachetools>=5.5
	chardet>=5.2
	colorama>=0.4.6
	devpi-process>=1.0.2; extra == 'test'
	filelock>=3.16.1
	packaging>=24.2
	platformdirs>=4.3.6
	pluggy>=1.5
	pyproject-api>=1.8
	pytest-mock>=3.14; extra == 'test'
	pytest>=8.3.3; extra == 'test'
	tomli>=2.1; python_version < '3.11'
	typing-extensions>=4.12.2; python_version < '3.11'
	virtualenv>=20.27.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cachetools-5.5[${PYTHON_USEDEP}]
	>=dev-python/chardet-5.2[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.5[${PYTHON_USEDEP}]
	>=dev-python/pyproject-api-1.8[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.27.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cachetools[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/filelock[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	dev-python/pyproject-api[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10)
	dev-python/virtualenv[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/devpi-process-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/distlib[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/re-assert[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/time-machine[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

src_prepare() {
	# upstream lower bounds are meaningless
	sed -i -e 's:>=[0-9.]*::' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	# devpi_process is not packaged, and has lots of dependencies
	cat > "${T}"/devpi_process.py <<-EOF || die
		def IndexServer(*args, **kwargs): raise NotImplementedError()
	EOF

	local -x PYTHONPATH=${T}:${PYTHONPATH}
	local EPYTEST_DESELECT=(
		# Internet
		tests/tox_env/python/virtual_env/package/test_package_cmd_builder.py::test_build_wheel_external
		tests/tox_env/python/virtual_env/package/test_package_cmd_builder.py::test_run_installpkg_targz
	)
	local EPYTEST_IGNORE=(
		# requires devpi*
		tests/test_provision.py
	)

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[explicit-True-True]'
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[requirements-True-True]'
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[constraints-True-True]'
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[explicit+requirements-True-True]'
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[requirements_indirect-True-True]'
				'tests/tox_env/python/pip/test_pip_install.py::test_constrain_package_deps[requirements_constraints_indirect-True-True]'
			)
			;;
		python3.13)
			EPYTEST_DESELECT+=(
				# https://github.com/tox-dev/tox/issues/3290
				'tests/config/loader/test_str_convert.py::test_str_convert_ok_py39[1,2-value1-Optional]'
			)
			;;
	esac

	epytest
}
