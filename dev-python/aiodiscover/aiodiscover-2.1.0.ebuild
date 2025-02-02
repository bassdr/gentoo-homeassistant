# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Discover hosts by arp and ptr lookup"
HOMEPAGE="
  https://pypi.org/project/aiodiscover/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiodns-3.1.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/aiodns-3.1.1[${PYTHON_USEDEP}] )
	>=dev-python/async-timeout-4.0.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/async-timeout-4.0.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/black-19_beta0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/bump2version-1.0.1[${PYTHON_USEDEP}] )
	>=dev-python/cached-ipaddress-0.2.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/cached-ipaddress-0.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/codecov-2.1.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/coverage-5.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flake8-3.8.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flake8-debugger-3.2.1[${PYTHON_USEDEP}] )
	all? ( dev-python/ifaddr[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-7.15.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/m2r2-0.2.7[${PYTHON_USEDEP}] )
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}] )
	>=dev-python/pyroute2-0.7.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyroute2-0.7.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-5.4.3[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-raises-0.11[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-3.4.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-rtd-theme-0.5.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tox-3.15.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/twine-3.1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/wheel-0.34.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/async-timeout-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/aiodns-3.1.1[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	>=dev-python/pyroute2-0.7.3[${PYTHON_USEDEP}]
	dev-python/cached-ipaddress[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/black-19_beta0[${PYTHON_USEDEP}]
	>=dev-python/bump2version-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/codecov-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/coverage-5.1[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/flake8-debugger-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.15.0[${PYTHON_USEDEP}]
	>=dev-python/m2r2-0.2.7[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-raises-0.11[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.4.3[${PYTHON_USEDEP}]
	>=dev-python/sphinx-rtd-theme-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/tox-3.15.2[${PYTHON_USEDEP}]
	>=dev-python/twine-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.34.2[${PYTHON_USEDEP}]
)"
