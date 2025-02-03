# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="sphinxcontrib-applehelp is a Sphinx extension which outputs Apple help books"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-applehelp/
  Changelog, https://github.com/sphinx-doc/sphinxcontrib-applehelp/blob/master/CHANGES.rst
  Code, https://github.com/sphinx-doc/sphinxcontrib-applehelp/
  Download, https://pypi.org/project/sphinxcontrib-applehelp/
  Homepage, https://www.sphinx-doc.org/
  Issue tracker, https://github.com/sphinx-doc/sphinx/issues/
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint standalone"
IUSE="${GENERATED_IUSE}"
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( ${PDEPEND} )
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
