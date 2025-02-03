# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="oslo.log"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/oslo.log/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="fixtures systemd"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	fixtures? ( >=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/oslo-config-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-context-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-serialization-2.25.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-utils-3.36.0[${PYTHON_USEDEP}]
	>=dev-python/pbr-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
	systemd? ( >=dev-python/systemd-python-234[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pbr-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/oslo-config-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-context-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-utils-7.1.0-r1[${PYTHON_USEDEP}]
	>=dev-python/oslo-serialization-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pbr-3.1.1[${PYTHON_USEDEP}]
	test? (
		>=dev-python/testtools-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-4.5.1[${PYTHON_USEDEP}]
		>=dev-python/eventlet-0.30.1[${PYTHON_USEDEP}]
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/stestr-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.3.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
distutils_enable_sphinx doc/source \
	dev-python/openstackdocstheme \
	dev-python/oslo-config

src_test() {
	# requires eventlet
	rm oslo_log/tests/unit/test_pipe_mutex.py || die

	distutils-r1_src_test
}
