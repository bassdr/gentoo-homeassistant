# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="The missing async toolbox"
HOMEPAGE="
  https://pypi.org/project/asyncstdlib/
  Documentation, https://asyncstdlib.readthedocs.io/en/latest/
  Source, https://github.com/maxfischer2781/asyncstdlib
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc typetest"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	test? (
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flake8-bugbear[${PYTHON_USEDEP}]
		dev-python/flake8_2020[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
