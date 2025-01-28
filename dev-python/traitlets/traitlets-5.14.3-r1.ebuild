# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/traitlets/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( >=dev-python/argcomplete-3.0.3[${PYTHON_USEDEP}] )
	test? ( >=dev-python/mypy-1.7.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	test? ( <dev-python/pytest-8.2[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mypy-testing[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		>=dev-python/argcomplete-2.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/source \
	dev-python/myst-parser \
	dev-python/pydata-sphinx-theme
distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		tests/test_typing.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}
