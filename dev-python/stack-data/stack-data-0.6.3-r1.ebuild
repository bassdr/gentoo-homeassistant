# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="stack_data"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/stack_data/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/asttokens-2.1.0[${PYTHON_USEDEP}]
	tests? ( dev-python/cython[${PYTHON_USEDEP}] )
	>=dev-python/executing-1.2.0[${PYTHON_USEDEP}]
	tests? ( dev-python/littleutils[${PYTHON_USEDEP}] )
	dev-python/pure-eval[${PYTHON_USEDEP}]
	tests? ( dev-python/pygments[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/typeguard[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/asttokens-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/executing-1.2.0[${PYTHON_USEDEP}]
	dev-python/pure-eval[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/cython[${PYTHON_USEDEP}]
		dev-python/typeguard[${PYTHON_USEDEP}]
		dev-python/littleutils[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Cython looks for the module in the wrong directory, for some reason
	tests/test_formatter.py::test_example
)
