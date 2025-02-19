# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for BlueZ Bluetooth Management API"
HOMEPAGE="
  https://pypi.org/project/btsocket/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs rel test"
IUSE="${GENERATED_IUSE}"

DOCS="README.rst"

distutils_enable_tests pytest
REQUIRES_DIST="
	bumpversion; extra == 'dev'
	bumpversion; extra == 'rel'
	coverage; extra == 'dev'
	coverage; extra == 'test'
	pycodestyle; extra == 'dev'
	pycodestyle; extra == 'test'
	pygments; extra == 'dev'
	pygments; extra == 'docs'
	sphinx-rtd-theme; extra == 'dev'
	sphinx-rtd-theme; extra == 'docs'
	sphinx; extra == 'dev'
	sphinx; extra == 'docs'
	twine; extra == 'dev'
	twine; extra == 'rel'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/bumpversion[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pycodestyle[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
GENERATED_RDEPEND="${RDEPEND}
	rel? ( dev-python/bumpversion[${PYTHON_USEDEP}] )
	docs? ( dev-python/pygments[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	rel? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
