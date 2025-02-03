# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Links recognition library with FULL unicode support."
HOMEPAGE="
  https://pypi.org/project/linkify-it-py/
  Homepage, https://github.com/tsutsu3/linkify-it-py
"
# no tests in sdist, as of 2.0.1
SRC_URI="
	https://github.com/tsutsu3/linkify-it-py/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="benchmark doc"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pytest[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	dev-python/uc-micro-py[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/uc-micro-py[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/pyproject-flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
