# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A final implementation of JSONPath for Python that aims to be standard compliant, including arithmetic and binary comparison operators and providing clear AST for metaprogramming."
HOMEPAGE="
  https://pypi.org/project/jsonpath-ng/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/ply[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/ply[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/oslotest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
