# Copyright 2017-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="A pure-Python implementation of SNMP/SMI MIB parsing and conversion library."
HOMEPAGE="
  https://pypi.org/project/pysmi/
  Repository, https://github.com/lextudio/pysmi
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2<4.0.0,>=3.1.3
	ply<4.0,>=3.11
	requests<3.0.0,>=2.26.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jinja2-3.1.3[${PYTHON_USEDEP}] <dev-python/jinja2-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/ply-3.11[${PYTHON_USEDEP}] <dev-python/ply-4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jinja2-3.1.3[${PYTHON_USEDEP}]
	>=dev-python/ply-3.11[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pysnmp-7.1.11[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# incompatibility with pysnmp >= 7
		tests/test_objecttype_smiv2_pysnmp.py::ObjectTypeBitsTestCase::testObjectTypeSyntax
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
