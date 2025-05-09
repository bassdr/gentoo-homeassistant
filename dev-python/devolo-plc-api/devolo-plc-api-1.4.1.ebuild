# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="devolo PLC devices in Python"
HOMEPAGE="
  https://pypi.org/project/devolo-plc-api/
  changelog, https://github.com/2Fake/devolo_plc_api/docs/CHANGELOG.md
  homepage, https://github.com/2Fake/devolo_plc_api
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx >=0.21.0
	ifaddr >=0.1.7
	mypy >=0.981 ; extra == 'dev'
	pre-commit ; extra == 'dev'
	protobuf >=4.22.0
	pytest ; extra == 'test'
	pytest-asyncio ; extra == 'test'
	pytest-cov ; extra == 'test'
	pytest-httpx >=0.18.0 ; extra == 'test'
	segno >=1.5.2
	syrupy ; extra == 'test'
	typing-extensions ; extra == 'test'
	zeroconf >=0.70.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.22.0[${PYTHON_USEDEP}]
	>=dev-python/segno-1.5.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.70.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/ifaddr[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.21[${PYTHON_USEDEP}]
	>=dev-python/segno-1.5.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.70.0[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/mypy-0.981[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-httpx-0.18.0[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
