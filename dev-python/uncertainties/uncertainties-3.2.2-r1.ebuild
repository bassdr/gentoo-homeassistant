# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/uncertainties/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all arrays doc test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	numpy; extra == 'arrays'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	python-docs-theme; extra == 'doc'
	sphinx-copybutton; extra == 'doc'
	sphinx; extra == 'doc'
	uncertainties[arrays,doc,test]; extra == 'all'
"
GENERATED_RDEPEND="${RDEPEND}
	arrays? ( dev-python/numpy[${PYTHON_USEDEP}] )
	doc? ( dev-python/python-docs-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	all? ( dev-python/uncertainties[arrays,doc,test,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "numpy support" dev-python/numpy
}
