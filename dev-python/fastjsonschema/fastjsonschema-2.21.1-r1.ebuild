# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="devel"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="Fastest Python implementation of JSON schema"
HOMEPAGE="
  https://pypi.org/project/fastjsonschema/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	colorama; extra == 'devel'
	json-spec; extra == 'devel'
	jsonschema; extra == 'devel'
	pylint; extra == 'devel'
	pytest-benchmark; extra == 'devel'
	pytest-cache; extra == 'devel'
	pytest; extra == 'devel'
	validictory; extra == 'devel'
"
GENERATED_RDEPEND="${RDEPEND}
	devel? ( dev-python/colorama[${PYTHON_USEDEP}] )
	devel? ( dev-python/json-spec[${PYTHON_USEDEP}] )
	devel? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	devel? ( dev-python/pylint[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-cache[${PYTHON_USEDEP}] )
	devel? ( dev-python/validictory[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	tests/benchmarks
)
