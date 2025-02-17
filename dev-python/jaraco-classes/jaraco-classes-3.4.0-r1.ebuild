# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.classes"
inherit distutils-r1 pypi

DESCRIPTION="Utility functions for Python class constructs"
HOMEPAGE="
  https://pypi.org/project/jaraco-classes/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo; extra == 'docs'
	jaraco.packaging>=9.3; extra == 'docs'
	jaraco.tidelift>=1.4; extra == 'docs'
	more-itertools
	pytest-checkdocs>=2.4; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-enabler>=2.2; extra == 'testing'
	pytest-mypy; extra == 'testing'
	pytest-ruff>=0.2.1; extra == 'testing'
	pytest>=6; extra == 'testing'
	rst.linker>=1.9; extra == 'docs'
	sphinx-lint; extra == 'docs'
	sphinx>=3.5; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
