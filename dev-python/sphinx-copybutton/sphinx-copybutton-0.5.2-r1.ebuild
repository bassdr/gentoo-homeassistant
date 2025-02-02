# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-copybutton/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code_style rtd"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	rtd? ( dev-python/ipython[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	rtd? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-examples[${PYTHON_USEDEP}] )
	code_style? ( ~dev-vcs/pre-commit-2.12.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/sphinx-6.0[${PYTHON_USEDEP}]
"
