# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Cross-platform lib for process and system monitoring in Python."
HOMEPAGE="
  https://pypi.org/project/psutil/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
REQUIRES_DIST="
	black; extra == 'dev'
	check-manifest; extra == 'dev'
	coverage; extra == 'dev'
	packaging; extra == 'dev'
	pylint; extra == 'dev'
	pyperf; extra == 'dev'
	pypinfo; extra == 'dev'
	pytest-cov; extra == 'dev'
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
	requests; extra == 'dev'
	rstcheck; extra == 'dev'
	ruff; extra == 'dev'
	setuptools; extra == 'test'
	sphinx; extra == 'dev'
	sphinx_rtd_theme; extra == 'dev'
	toml-sort; extra == 'dev'
	twine; extra == 'dev'
	virtualenv; extra == 'dev'
	wheel; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pyperf[${PYTHON_USEDEP}]
		dev-python/pypinfo[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rstcheck[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/toml-sort[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# hardcoded assumptions about the test environment
		tests/test_linux.py::TestRootFsDeviceFinder::test_disk_partitions_mocked
		tests/test_linux.py::TestSystemDiskPartitions::test_zfs_fs
		tests/test_linux.py::TestSystemNetIfAddrs::test_ips
		tests/test_posix.py::TestProcess::test_nice
		tests/test_process.py::TestProcess::test_ionice_linux
		tests/test_system.py::TestDiskAPIs::test_disk_partitions

		# mocking is broken
		tests/test_linux.py::TestSensorsBattery::test_emulate_energy_full_0
		tests/test_linux.py::TestSensorsBattery::test_emulate_energy_full_not_avail
		tests/test_linux.py::TestSensorsBattery::test_emulate_no_power
		tests/test_linux.py::TestSensorsBattery::test_emulate_power_undetermined

		# doesn't like sandbox injecting itself
		tests/test_process.py::TestProcess::test_weird_environ

		# extremely flaky
		tests/test_linux.py::TestSystemVirtualMemoryAgainstFree::test_used
		tests/test_linux.py::TestSystemVirtualMemoryAgainstVmstat::test_used

		# nproc --all is broken?
		tests/test_linux.py::TestSystemCPUCountLogical::test_against_nproc

		# broken on some architectures
		tests/test_linux.py::TestSystemCPUCountCores::test_method_2
		tests/test_linux.py::TestSystemCPUCountLogical::test_emulate_fallbacks
		tests/test_linux.py::TestSystemCPUFrequency::test_emulate_use_cpuinfo
		tests/test_linux.py::TestSystemCPUFrequency::test_emulate_use_second_file
		tests/test_system.py::TestCpuAPIs::test_cpu_freq
		tests/test_system.py::TestCpuAPIs::test_cpu_times_comparison

		# broken in some setups
		tests/test_linux.py::TestMisc::test_issue_687
		tests/test_linux.py::TestProcessAgainstStatus::test_cpu_affinity
		tests/test_linux.py::TestSystemCPUStats::test_interrupts
		tests/test_posix.py::TestProcess::test_cmdline
		tests/test_posix.py::TestProcess::test_name
		tests/test_posix.py::TestSystemAPIs::test_users
		tests/test_process.py::TestProcess::test_terminal
		tests/test_unicode.py::TestFSAPIs::test_memory_maps

		# fails on all AT containers
		tests/test_system.py::TestMiscAPIs::test_users

		# failing without /sys/class/power_supply?
		tests/test_memleaks.py::TestModuleFunctionsLeaks::test_sensors_battery
		tests/test_misc.py::TestMisc::test_serialization
	)

	# Since we are running in an environment a bit similar to CI,
	# let's skip the tests that are disabled for CI
	local -x TRAVIS=1
	local -x APPVEYOR=1
	local -x GITHUB_ACTIONS=1

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	rm -rf psutil || die
	epytest --pyargs psutil
}

python_compile() {
	# Force -j1 to avoid .o linking race conditions
	local MAKEOPTS=-j1
	distutils-r1_python_compile
}
