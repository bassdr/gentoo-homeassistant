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

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint standalone test"
IUSE="${GENERATED_IUSE}"
PDEPEND="
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	Sphinx>=5; extra == 'standalone'
	html5lib; extra == 'test'
	mypy; extra == 'lint'
	pytest; extra == 'test'
	ruff==0.5.5; extra == 'lint'
	types-docutils; extra == 'lint'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/html5lib[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		${PDEPEND}
		dev-python/html5lib[${PYTHON_USEDEP}]
	)
"

GENERATED_RDEPEND="${RDEPEND}
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/ruff-0.5.5[${PYTHON_USEDEP}] )
	standalone? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-docutils[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
