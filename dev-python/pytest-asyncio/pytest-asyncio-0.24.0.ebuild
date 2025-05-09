# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Pytest support for asyncio"
HOMEPAGE="
  https://pypi.org/project/pytest-asyncio/
  Bug Tracker, https://github.com/pytest-dev/pytest-asyncio/issues
  Changelog, https://pytest-asyncio.readthedocs.io/en/latest/reference/changelog.html
  Documentation, https://pytest-asyncio.readthedocs.io
  Homepage, https://github.com/pytest-dev/pytest-asyncio
  Source Code, https://github.com/pytest-dev/pytest-asyncio
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage>=6.2; extra == 'testing'
	hypothesis>=5.7.1; extra == 'testing'
	pytest<9,>=8.2
	sphinx-rtd-theme>=1.0; extra == 'docs'
	sphinx>=5.3; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-8.2[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-8.2[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-6.2[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-5.7.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/hypothesis-5.7.1[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# rely on precise warning counts
		tests/hypothesis/test_base.py::test_can_use_explicit_event_loop_fixture
		tests/test_event_loop_fixture.py::test_event_loop_fixture_handles_unclosed_async_gen
		tests/test_event_loop_fixture_finalizer.py::test_event_loop_fixture_finalizer_raises_warning_when_fixture_leaves_loop_unclosed
		tests/test_event_loop_fixture_finalizer.py::test_event_loop_fixture_finalizer_raises_warning_when_test_leaves_loop_unclosed
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_asyncio.plugin,_hypothesis_pytestplugin
	epytest
}
