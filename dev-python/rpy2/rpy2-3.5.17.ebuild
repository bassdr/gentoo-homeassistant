# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_REQ_USE="sqlite"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rpy2/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all doc test-minimal types"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.15.1[${PYTHON_USEDEP}]
	test-minimal? ( dev-python/coverage[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	doc? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	doc? ( dev-python/multipledispatch[${PYTHON_USEDEP}] )
	types? ( dev-python/mypy[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	<dev-python/numpy-1.26[${PYTHON_USEDEP}]
	doc? ( dev-python/numpy[${PYTHON_USEDEP}] )
	>=dev-python/pandas-1.3.5[${PYTHON_USEDEP}]
	doc? ( dev-python/pandas[${PYTHON_USEDEP}] )
	doc? ( dev-python/pygraphviz[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-minimal? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	test-minimal? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	types? ( dev-python/types-tzlocal[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-lang/R-4.0
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"

pkg_postinst() {
	optfeature "ipython integration" dev-python/ipython
	optfeature "numpy integration" dev-python/numpy
	optfeature "pandas integration" dev-python/pandas
}
