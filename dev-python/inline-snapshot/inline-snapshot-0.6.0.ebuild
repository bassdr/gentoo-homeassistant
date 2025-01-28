# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/inline-snapshot/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/asttokens-2.0.5[${PYTHON_USEDEP}]
	>=dev-python/black-23.3.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.4[${PYTHON_USEDEP}]
	>=dev-python/executing-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/types-toml-0.10.8.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/asttokens-2.0.5[${PYTHON_USEDEP}]
	>=dev-python/black-23.3.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.4[${PYTHON_USEDEP}]
	>=dev-python/executing-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2.0.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		dev-python/attrs[${PYTHON_USEDEP}]
		>=dev-python/dirty-equals-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.75.5[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/mypy[${PYTHON_USEDEP}]
		' 'python*')
		>=dev-python/pydantic-2[${PYTHON_USEDEP}]
		>=dev-python/pytest-freezer-0.4.8[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-subtests-0.11.0[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# requires pyright
		'tests/test_typing.py::test_typing[pyright]'
	)

	local -x COLUMNS=80
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=inline_snapshot.pytest_plugin,pytest_freezer,pytest_subtests.plugin,xdist.plugin
	local -x PYTHONPATH=${S}/src
	epytest -p pytest_mock
}
