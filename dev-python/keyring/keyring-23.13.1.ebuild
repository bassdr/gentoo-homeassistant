# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Store and access your passwords safely."
HOMEPAGE="
  https://pypi.org/project/keyring/
"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="completion docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	SecretStorage (>=3.2) ; sys_platform == 'linux'
	flake8 (<5) ; extra == 'testing'
	furo ; extra == 'docs'
	importlib-metadata (>=4.11.4) ; python_version < '3.12'
	importlib-resources ; python_version < '3.9'
	jaraco.classes
	jaraco.packaging (>=9) ; extra == 'docs'
	jaraco.tidelift (>=1.4) ; extra == 'docs'
	jeepney (>=0.4.2) ; sys_platform == 'linux'
	pytest (>=6) ; extra == 'testing'
	pytest-black (>=0.3.7) ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pytest-checkdocs (>=2.4) ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-enabler (>=1.3) ; extra == 'testing'
	pytest-flake8 ; (python_version < '3.12') and extra == 'testing'
	pytest-mypy (>=0.9.1) ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pywin32-ctypes (>=0.2.0) ; sys_platform == 'win32'
	rst.linker (>=1.9) ; extra == 'docs'
	shtab ; extra == 'completion'
	sphinx (>=3.5) ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	>=dev-python/jeepney-0.4.2[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	>=dev-python/secretstorage-3.2[${PYTHON_USEDEP}]
	completion? ( dev-python/shtab[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/secretstorage-3.2[${PYTHON_USEDEP}]
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	dev-python/jaraco-functools[${PYTHON_USEDEP}]
	>=dev-python/jeepney-0.4.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib-metadata-4.11.4[${PYTHON_USEDEP}]
	' 3.10 3.11)
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pyfakefs[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		<dev-python/flake8-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-1.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# this test fails if importlib-metadata returns more than one
		# entry, i.e. when keyring is installed already
		tests/test_packaging.py::test_entry_point
	)
	local EPYTEST_IGNORE=(
		# apparently does not unlock the keyring properly
		tests/backends/test_libsecret.py
		# hangs
		tests/backends/test_kwallet.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts=
}
