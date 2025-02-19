# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="Plumbum: shell combinators library"
HOMEPAGE="
  https://pypi.org/project/plumbum/
  Homepage, https://github.com/tomerfiliba/plumbum
  Documentation, https://plumbum.readthedocs.io/
  Bug Tracker, https://github.com/tomerfiliba/plumbum/issues
  Changelog, https://plumbum.readthedocs.io/en/latest/changelog.html
  Cheatsheet, https://plumbum.readthedocs.io/en/latest/quickref.html
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs ssh test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	coverage[toml]; extra == 'dev'
	coverage[toml]; extra == 'test'
	importlib-resources; python_version < '3.9'
	paramiko; extra == 'dev'
	paramiko; extra == 'ssh'
	paramiko; extra == 'test'
	psutil; extra == 'dev'
	psutil; extra == 'test'
	pytest-cov; extra == 'dev'
	pytest-cov; extra == 'test'
	pytest-mock; extra == 'dev'
	pytest-mock; extra == 'test'
	pytest-timeout; extra == 'dev'
	pytest-timeout; extra == 'test'
	pytest>=6.0; extra == 'dev'
	pytest>=6.0; extra == 'test'
	pywin32; platform_system == 'Windows' and platform_python_implementation != 'PyPy'
	sphinx-rtd-theme>=1.0.0; extra == 'docs'
	sphinx>=4.0.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	ssh? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/paramiko[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"


python_test() {
	local EPYTEST_DESELECT=(
		# Need sshd running
		tests/test_remote.py
		tests/test_utils.py
		# Windows specific
		tests/test_putty.py
		# Needs sudo without password
		tests/test_sudo.py
		# Wrong assumptions about env handling
		tests/test_env.py::TestEnv::test_change_env
		tests/test_env.py::TestEnv::test_dictlike
		tests/test_local.py::TestLocalPath::test_iterdir
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p pytest_mock -p timeout
}

pkg_postinst() {
	optfeature "remote commands via ssh" dev-python/paramiko
	optfeature "progress bars in jupyter" dev-python/ipywidgets
	optfeature "colored output in jupyter" dev-python/ipython
	optfeature "images on the command line" dev-python/pillow
}
