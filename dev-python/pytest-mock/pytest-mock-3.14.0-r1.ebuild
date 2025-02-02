# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_TESTED=( python3_{10..13} pypy3 )
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Thin-wrapper around the mock package for easier use with pytest"
HOMEPAGE="
  https://pypi.org/project/pytest-mock/
  Homepage, https://github.com/pytest-dev/pytest-mock/
  Documentation, https://pytest-mock.readthedocs.io/en/latest/
  Changelog, https://pytest-mock.readthedocs.io/en/latest/changelog.html
  Source, https://github.com/pytest-dev/pytest-mock/
  Tracker, https://github.com/pytest-dev/pytest-mock/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		$(python_gen_cond_dep '
			dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		' "${PYTHON_TESTED[@]}")
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"

python_test() {
	if ! has "${EPYTHON/./_}" "${PYTHON_TESTED[@]}"; then
		einfo "Skipping tests on ${EPYTHON}"
		return
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_mock,pytest_asyncio.plugin
	local EPYTEST_DESELECT=()

	if has_version dev-python/mock; then
		EPYTEST_DESELECT+=(
			tests/test_pytest_mock.py::test_standalone_mock
		)
	fi

	epytest --assert=plain
}
