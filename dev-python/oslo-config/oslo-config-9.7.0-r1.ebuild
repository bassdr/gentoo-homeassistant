# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="oslo.config"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/oslo.config/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="rst-generator test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( >=dev-python/coverage-4.0[${PYTHON_USEDEP}] )
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/mypy-0.720[${PYTHON_USEDEP}] )
	>=dev-python/netaddr-0.7.18[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.15.3[${PYTHON_USEDEP}]
	test? ( >=dev-python/oslo-log-3.36.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/oslotest-3.2.0[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/requests-mock-1.5.0[${PYTHON_USEDEP}] )
	>=dev-python/rfc3986-1.2.0[${PYTHON_USEDEP}]
	rst-generator? ( >=dev-python/rst2txt-1.1.0[${PYTHON_USEDEP}] )
	rst-generator? ( >=dev-python/sphinx-1.8.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/stestr-2.1.0[${PYTHON_USEDEP}] )
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/testscenarios-0.4[${PYTHON_USEDEP}] )
	test? ( >=dev-python/testtools-2.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pbr-1.3[${PYTHON_USEDEP}]
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.7.18[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.15.3[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pbr-1.3[${PYTHON_USEDEP}]
	test? (
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/oslo-log-3.36.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

src_prepare() {
	# broken by some dep upgrade
	sed -i -e '/DeprecationWarningTestsNoOsloLog/,$d' \
		oslo_config/tests/test_cfg.py || die
	distutils-r1_src_prepare
}

python_test() {
	local -x COLUMNS=80
	eunittest -b
}
