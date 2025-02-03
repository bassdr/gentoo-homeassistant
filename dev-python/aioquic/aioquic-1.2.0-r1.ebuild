# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aioquic/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
DEPEND="
	dev-libs/openssl:=
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	<dev-python/pylsqpack-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24[${PYTHON_USEDEP}]
	>=dev-python/service-identity-24.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	<dev-python/pylsqpack-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/pylsqpack-0.3.3[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24[${PYTHON_USEDEP}]
	>=dev-python/service-identity-24.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.2.2[toml,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
