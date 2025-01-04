# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

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

GENERATED_DEPEND="
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
"
BDEPEND="
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