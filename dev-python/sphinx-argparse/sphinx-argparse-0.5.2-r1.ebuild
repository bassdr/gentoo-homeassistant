# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-argparse/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs lint markdown"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	CommonMark>=0.5.6; extra == 'docs'
	CommonMark>=0.5.6; extra == 'markdown'
	coverage>=6.5; extra == 'test'
	docutils>=0.19
	furo>=2024; extra == 'docs'
	lxml-stubs>=0.4; extra == 'lint'
	lxml>=4.9; extra == 'test'
	mypy>=1.10; extra == 'lint'
	pytest>=8.0; extra == 'test'
	ruff>=0.5; extra == 'lint'
	setuptools>=70.0; extra == 'test'
	sphinx>=5.1.0
	types-docutils>=0.21; extra == 'lint'
	typing_extensions>=4.9; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/commonmark-0.5.6[${PYTHON_USEDEP}] )
	markdown? ( >=dev-python/commonmark-0.5.6[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	docs? ( >=dev-python/furo-2024[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/lxml-stubs-0.4[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-1.10[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/ruff-0.5[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5.1.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/types-docutils-0.21[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	>=dev-python/sphinx-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/commonmark-0.5.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-6.5[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.9[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/setuptools-70.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.9[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
