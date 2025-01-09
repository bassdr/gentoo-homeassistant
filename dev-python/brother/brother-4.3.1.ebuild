# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for getting data from Brother laser and inkjet printers via SNMP."
HOMEPAGE="
  https://pypi.org/project/brother/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/dacite[${PYTHON_USEDEP}]
	dev-python/pysnmp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/pysnmp-6.2.6[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/pytest-runner[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
