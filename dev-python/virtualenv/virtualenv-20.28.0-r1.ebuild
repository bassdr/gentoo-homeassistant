# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multiprocessing pypi

DESCRIPTION="Virtual Python Environment builder"
HOMEPAGE="
  https://pypi.org/project/virtualenv/
  Documentation, https://virtualenv.pypa.io
  Homepage, https://github.com/pypa/virtualenv
  Source, https://github.com/pypa/virtualenv
  Tracker, https://github.com/pypa/virtualenv/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	covdefaults>=2.3; extra == 'test'
	coverage-enable-subprocess>=1; extra == 'test'
	coverage>=7.2.7; extra == 'test'
	distlib<1,>=0.3.7
	filelock<4,>=3.12.2
	flaky>=3.7; extra == 'test'
	furo>=2023.7.26; extra == 'docs'
	importlib-metadata>=6.6; python_version < '3.8'
	packaging>=23.1; extra == 'test'
	platformdirs<5,>=3.9.1
	proselint>=0.13; extra == 'docs'
	pytest-env>=0.8.2; extra == 'test'
	pytest-freezer>=0.4.8; (platform_python_implementation == 'PyPy' or (platform_python_implementation == 'CPython' and sys_platform == 'win32' and python_version >= '3.13')) and extra == 'test'
	pytest-mock>=3.11.1; extra == 'test'
	pytest-randomly>=3.12; extra == 'test'
	pytest-timeout>=2.1; extra == 'test'
	pytest>=7.4; extra == 'test'
	setuptools>=68; extra == 'test'
	sphinx!=7.3,>=7.1.2; extra == 'docs'
	sphinx-argparse>=0.4; extra == 'docs'
	sphinxcontrib-towncrier>=0.2.1a0; extra == 'docs'
	time-machine>=2.10; platform_python_implementation == 'CPython' and extra == 'test'
	towncrier>=23.6; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/distlib-0.3.7[${PYTHON_USEDEP}] <dev-python/distlib-1[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.12.2[${PYTHON_USEDEP}] <dev-python/filelock-4[${PYTHON_USEDEP}]
	docs? ( >=dev-python/furo-2023.7.26[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-3.9.1[${PYTHON_USEDEP}] <dev-python/platformdirs-5[${PYTHON_USEDEP}]
	docs? ( >=dev-python/proselint-0.13[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}] !~dev-python/sphinx-7.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-argparse-0.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-towncrier-0.2.1_alpha0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/towncrier-23.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/distlib-0.3.7[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.12.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.9.1[${PYTHON_USEDEP}]

	dev-python/ensurepip-pip
	dev-python/ensurepip-setuptools
	dev-python/ensurepip-wheel
"
# coverage is used somehow magically in virtualenv, maybe it actually
# tests something useful
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.2.7[${PYTHON_USEDEP}]
		>=dev-python/coverage-enable-subprocess-1[${PYTHON_USEDEP}]
		>=dev-python/flaky-3.7[${PYTHON_USEDEP}]
		>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-env-0.8.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.11.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-randomly-3.12[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1[${PYTHON_USEDEP}]
		>=dev-python/setuptools-68[${PYTHON_USEDEP}]
		>=dev-python/time-machine-2.10[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		>=dev-python/pip-22.2.1[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			>=dev-python/pytest-freezer-0.4.6[${PYTHON_USEDEP}]
		' pypy3)
		>=dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		>=dev-python/setuptools-67.8[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/time-machine[${PYTHON_USEDEP}]
		' 'python3*')
		dev-python/wheel[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	)
"

EPYTEST_TIMEOUT=180
distutils_enable_tests pytest

src_prepare() {
	local PATCHES=(
		# use wheels from ensurepip bundle
		"${FILESDIR}/${PN}-20.26.3-ensurepip.patch"
	)

	distutils-r1_src_prepare

	# workaround test failures due to warnings from setuptools-scm, sigh
	echo '[tool.setuptools_scm]' >> pyproject.toml || die

	# remove useless pins
	sed -i -e 's:,<[0-9.]*::' pyproject.toml || die

	# remove bundled wheels
	rm src/virtualenv/seed/wheels/embed/*.whl || die
}

python_test() {
	local EPYTEST_DESELECT=(
		tests/unit/seed/embed/test_bootstrap_link_via_app_data.py::test_seed_link_via_app_data
		# tests for old wheels with py3.7 support
		tests/unit/seed/embed/test_pip_invoke.py::test_base_bootstrap_via_pip_invoke
		tests/unit/seed/wheels/test_wheels_util.py::test_wheel_not_support
		# broken by different wheel versions in ensurepip
		tests/unit/seed/wheels/test_acquire_find_wheel.py::test_find_latest_string
		tests/unit/seed/wheels/test_acquire_find_wheel.py::test_find_exact
		tests/unit/seed/wheels/test_acquire_find_wheel.py::test_find_latest_none
		tests/unit/seed/wheels/test_acquire.py::test_download_wheel_bad_output
		# hangs on a busy system, sigh
		tests/unit/test_util.py::test_reentrant_file_lock_is_thread_safe
	)
	case ${EPYTHON} in
		python3.1[23])
			EPYTEST_DESELECT+=(
				tests/unit/create/via_global_ref/test_build_c_ext.py
			)
			;&
		python3.11)
			EPYTEST_DESELECT+=(
				# TODO
				tests/unit/discovery/py_info/test_py_info.py::test_fallback_existent_system_executable
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x TZ=UTC
	local plugins=( -p flaky -p pytest_mock )
	if [[ ${EPYTHON} == pypy3 ]]; then
		plugins+=( -p freezer )
	else
		plugins+=( -p time_machine )
	fi
	epytest "${plugins[@]}" -p xdist -n "$(makeopts_jobs)" --dist=worksteal
}

src_install() {
	distutils-r1_src_install

	# remove bundled wheels, we're using ensurepip bundle instead
	find "${ED}" -name '*.whl' -delete || die
}
