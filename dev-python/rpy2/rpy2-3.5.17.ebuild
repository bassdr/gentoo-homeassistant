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

GENERATED_IUSE="all doc numpy pandas test test-minimal types"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	backports.zoneinfo; python_version < '3.9'
	cffi>=1.15.1
	coverage; extra == 'test-minimal'
	ipykernel; extra == 'doc'
	ipython; extra == 'all'
	ipython; extra == 'test'
	jinja2
	jupytext; extra == 'doc'
	multipledispatch; extra == 'doc'
	mypy; extra == 'types'
	nbconvert; extra == 'doc'
	numpy; extra == 'doc'
	numpy<1.26; python_version < '3.9' and extra == 'all'
	numpy<1.26; python_version < '3.9' and extra == 'numpy'
	numpy<1.26; python_version < '3.9' and extra == 'pandas'
	numpy<1.26; python_version < '3.9' and extra == 'test'
	numpy>=1.26; python_version >= '3.9' and extra == 'all'
	numpy>=1.26; python_version >= '3.9' and extra == 'numpy'
	numpy>=1.26; python_version >= '3.9' and extra == 'pandas'
	numpy>=1.26; python_version >= '3.9' and extra == 'test'
	packaging; platform_system == 'Windows'
	pandas; extra == 'doc'
	pandas; python_version < '3.10' and extra == 'all'
	pandas; python_version < '3.10' and extra == 'pandas'
	pandas; python_version < '3.10' and extra == 'test'
	pandas>=1.3.5; python_version >= '3.10' and extra == 'all'
	pandas>=1.3.5; python_version >= '3.10' and extra == 'pandas'
	pandas>=1.3.5; python_version >= '3.10' and extra == 'test'
	pygraphviz; extra == 'doc'
	pytest-cov; extra == 'test-minimal'
	pytest; extra == 'all'
	pytest; extra == 'test'
	pytest>=8; extra == 'test-minimal'
	sphinx; extra == 'doc'
	types-tzlocal; extra == 'types'
	typing-extensions; python_version < '3.8'
	tzlocal
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.15.1[${PYTHON_USEDEP}]
	test-minimal? ( dev-python/coverage[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	doc? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	doc? ( dev-python/multipledispatch[${PYTHON_USEDEP}] )
	types? ( dev-python/mypy[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	all? ( >=dev-python/numpy-1.26[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpy[${PYTHON_USEDEP}] )
	numpy? ( >=dev-python/numpy-1.26[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/numpy-1.26[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pandas-1.3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/pandas[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pandas-1.3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/pygraphviz[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-minimal? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	test-minimal? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	types? ( dev-python/types-tzlocal[${PYTHON_USEDEP}] )
	dev-python/tzlocal[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-lang/R-4.0
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/ipython[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.3.5[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		${RDEPEND}
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "ipython integration" dev-python/ipython
	optfeature "numpy integration" dev-python/numpy
	optfeature "pandas integration" dev-python/pandas
}
