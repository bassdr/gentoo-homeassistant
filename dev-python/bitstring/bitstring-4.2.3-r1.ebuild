# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Simple construction, analysis and modification of binary data."
HOMEPAGE="
  https://pypi.org/project/bitstring/
  homepage, https://github.com/scott-griffiths/bitstring
  documentation, https://bitstring.readthedocs.io/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/bitarray-3.0.0[${PYTHON_USEDEP}]
	dev-python/bitarray[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/bitarray-3[${PYTHON_USEDEP}]
	>=dev-python/bitarray-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/gfloat-0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	tests/test_benchmarks.py
)
