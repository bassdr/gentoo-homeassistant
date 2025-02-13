# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp documents"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-devhelp/
  Changelog, https://github.com/sphinx-doc/sphinxcontrib-devhelp/blob/master/CHANGES.rst
  Code, https://github.com/sphinx-doc/sphinxcontrib-devhelp/
  Download, https://pypi.org/project/sphinxcontrib-devhelp/
  Homepage, https://www.sphinx-doc.org/
  Issue tracker, https://github.com/sphinx-doc/sphinx/issues/
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint standalone"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/ruff-0.5.5[${PYTHON_USEDEP}] )
	standalone? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-docutils[${PYTHON_USEDEP}] )
"
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( ${PDEPEND} )
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
