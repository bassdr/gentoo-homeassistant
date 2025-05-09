# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-autodoc-typehints/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	covdefaults>=2.3; extra == 'testing'
	coverage>=7.6.10; extra == 'testing'
	defusedxml>=0.7.1; extra == 'testing'
	diff-cover>=9.2.1; extra == 'testing'
	furo>=2024.8.6; extra == 'docs'
	pytest-cov>=6; extra == 'testing'
	pytest>=8.3.4; extra == 'testing'
	sphinx>=8.1.3
	sphobjinv>=2.3.1.2; extra == 'testing'
	typing-extensions>=4.12.2; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-8.1.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}]
"
# skipping optional test dep on dev-python/nptyping as that package
# is horribly broken and on its way out
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.6.10[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/diff-cover-9.2.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-6[${PYTHON_USEDEP}]
		>=dev-python/sphobjinv-2.3.1.2[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/sphobjinv-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# this package is addicted to Internet
		tests/test_sphinx_autodoc_typehints.py::test_format_annotation
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
