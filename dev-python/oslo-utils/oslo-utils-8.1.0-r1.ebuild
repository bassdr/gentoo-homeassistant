# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit check-reqs distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/oslo-utils/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML>=3.13
	debtcollector>=1.2.0
	iso8601>=0.1.11
	netaddr>=0.10.0
	oslo.i18n>=3.15.3
	packaging>=20.4
	pbr>=6.1.0
	psutil>=3.2.2
	pyparsing>=2.1.0
	tzdata>=2022.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/iso8601-0.1.11[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.15.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/pbr-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.2.2[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/iso8601-0.1.11[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.15.3[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.2.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
"
# qemu needed for qemu-img
BDEPEND="
	>=dev-python/pbr-2.2.0[${PYTHON_USEDEP}]
	test? (
		app-cdr/cdrtools
		app-emulation/qemu
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/ddt-1.0.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

# note this only applies to USE=test
CHECKREQS_DISK_BUILD=8G

pkg_pretend() {
	use test && check-reqs_pkg_pretend
}

pkg_setup() {
	use test && check-reqs_pkg_setup
}

src_prepare() {
	distutils-r1_src_prepare

	# require eventlet
	rm oslo_utils/tests/test_eventletutils.py || die
}
