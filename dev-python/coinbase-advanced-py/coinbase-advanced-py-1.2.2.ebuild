# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
SRC_URI="https://github.com/coinbase/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="Coinbase Advanced API Python SDK"
HOMEPAGE="
  https://pypi.org/project/coinbase-advanced-py/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="lint"
IUSE="${GENERATED_IUSE}"

DOCS="README.md"

REQUIRES_DIST="
	PyJWT>=2.8.0
	asynctest==0.13.0; extra == 'test'
	backoff>=2.2.1
	black==23.3.0; extra == 'lint'
	cryptography>=42.0.4
	isort==5.12.0; extra == 'lint'
	requests-mock==1.11.0; extra == 'test'
	requests>=2.31.0
	websockets>=12.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	lint? ( ~dev-python/black-23.3.0[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-42.0.4[${PYTHON_USEDEP}]
	lint? ( ~dev-python/isort-5.12.0[${PYTHON_USEDEP}] )
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

src_prepare() {
	mv ${S}/coinbase ${S}/coinbase-advanced-py || die
	sed 's/packages=find_packages(exclude=("tests",))/packages=find_packages(exclude=["tests","tests.*"])/g' -i setup.py || die
	eapply "${FILESDIR}"/rename-coinbase.patch
	eapply_user
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.11.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
