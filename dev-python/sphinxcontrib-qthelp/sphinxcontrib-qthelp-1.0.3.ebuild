# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="sphinxcontrib-qthelp is a sphinx extension which outputs QtHelp documents"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-qthelp/
  Changelog, https://github.com/sphinx-doc/sphinxcontrib-qthelp/blob/master/CHANGES.rst
  Code, https://github.com/sphinx-doc/sphinxcontrib-qthelp/
  Download, https://pypi.org/project/sphinxcontrib-qthelp/
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
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		${PDEPEND}
	)
"

distutils_enable_tests pytest
