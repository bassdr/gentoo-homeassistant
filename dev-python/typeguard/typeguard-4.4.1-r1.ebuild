# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Run-time type checker for Python"
HOMEPAGE="
  https://pypi.org/project/typeguard/
  Documentation, https://typeguard.readthedocs.io/en/latest/
  Change log, https://typeguard.readthedocs.io/en/latest/versionhistory.html
  Source code, https://github.com/agronholm/typeguard
  Issue tracker, https://github.com/agronholm/typeguard/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx>=7; extra == 'doc'
	coverage[toml]>=7; extra == 'test'
	importlib-metadata>=3.6; python_version < '3.10'
	mypy>=1.2.0; platform_python_implementation != 'PyPy' and extra == 'test'
	packaging; extra == 'doc'
	pytest>=7; extra == 'test'
	sphinx-autodoc-typehints>=1.2.0; extra == 'doc'
	sphinx-rtd-theme>=1.3.0; extra == 'doc'
	typing-extensions>=4.10.0
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/packaging[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-autodoc-typehints-1.2.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7[toml,${PYTHON_USEDEP}]
		>=dev-python/mypy-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-6.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# mypy changes results from version to version
		tests/mypy
	)

	local -x PYTHONDONTWRITEBYTECODE=
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# the XFAIL test pass due to some package being installed
	epytest -o xfail_strict=False -p typeguard
}
