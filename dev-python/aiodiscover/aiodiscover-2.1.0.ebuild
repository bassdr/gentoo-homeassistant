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
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/cached-ipaddress[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/pyroute2[${PYTHON_USEDEP}]
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
