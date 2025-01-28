# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="ZConfig"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ZConfig/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/docutils[${PYTHON_USEDEP}] )
	test? ( dev-python/manuel[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-programoutput[${PYTHON_USEDEP}] )
	test? ( dev-python/zope-exceptions[${PYTHON_USEDEP}] )
	test? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/docutils[${PYTHON_USEDEP}]
		dev-python/manuel[${PYTHON_USEDEP}]
		dev-python/zope-exceptions[${PYTHON_USEDEP}]
		dev-python/zope-interface[${PYTHON_USEDEP}]
	)
"

DOCS=( CHANGES.rst README.rst )

distutils_enable_tests unittest
distutils_enable_sphinx docs \
	dev-python/sphinxcontrib-programoutput

python_test() {
	eunittest -s src/ZConfig/tests
}
