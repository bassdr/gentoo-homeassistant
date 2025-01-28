# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytoolconfig/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc gendocs global validation"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	global? ( >=dev-python/platformdirs-3.11.0[${PYTHON_USEDEP}] )
	validation? ( >=dev-python/pydantic-2.5.3[${PYTHON_USEDEP}] )
	gendocs? ( dev-python/pytoolconfig[doc,${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}] )
	gendocs? ( >=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}] )
	gendocs? ( >=dev-python/sphinx-autodoc-typehints-1.25.2[${PYTHON_USEDEP}] )
	gendocs? ( >=dev-python/sphinx-rtd-theme-2.0.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.11.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	' 3.10 )
"
BDEPEND="
	test? (
		>=dev-python/sphinx-4.5.0[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.8.9[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
