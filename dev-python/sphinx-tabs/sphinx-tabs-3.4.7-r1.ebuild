# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-tabs/"
SRC_URI="
	https://github.com/executablebooks/sphinx-tabs/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code-style test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	bs4; extra == 'testing'
	coverage; extra == 'testing'
	docutils
	pre-commit==2.13.0; extra == 'code-style'
	pygments
	pygments; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-regressions; extra == 'testing'
	pytest<8,>=7.1; extra == 'testing'
	rinohtype; extra == 'testing'
	sphinx>=1.8
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	code-style? ( ~dev-vcs/pre-commit-2.13.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/rinohtype[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

EPYTEST_DESELECT=(
	# Unpackaged rinohtype
	tests/test_build.py::test_rinohtype_pdf
)
