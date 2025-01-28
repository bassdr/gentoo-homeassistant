# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="sphinxcontrib-htmlhelp is a sphinx extension which renders HTML help files"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-htmlhelp/
  Changelog, https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/blob/master/CHANGES.rst
  Code, https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/
  Download, https://pypi.org/project/sphinxcontrib-htmlhelp/
  Homepage, https://www.sphinx-doc.org/
  Issue tracker, https://github.com/sphinx-doc/sphinx/issues/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	lint? ( dev-python/docutils-stubs[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	test? ( dev-python/html5lib[${PYTHON_USEDEP}] )
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${PDEPEND}
		dev-python/html5lib[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
