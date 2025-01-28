# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-issues/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev? ( dev-python/sphinx-issues[tests,${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev? ( <dev-vcs/pre-commit-5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# doesn't work in our pep517 install
	tests/test_sphinx_issues.py::test_sphinx_build_integration
)
