# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mdit-py-plugins/"
SRC_URI="
	https://github.com/executablebooks/mdit-py-plugins/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code-style rtd"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage; extra == 'testing'
	markdown-it-py<4.0.0,>=1.0.0
	myst-parser; extra == 'rtd'
	pre-commit; extra == 'code-style'
	pytest-cov; extra == 'testing'
	pytest-regressions; extra == 'testing'
	pytest; extra == 'testing'
	sphinx-book-theme; extra == 'rtd'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/markdown-it-py-1.0.0[${PYTHON_USEDEP}] <dev-python/markdown-it-py-4.0.0[${PYTHON_USEDEP}]
	rtd? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	code-style? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/markdown-it-py-4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
