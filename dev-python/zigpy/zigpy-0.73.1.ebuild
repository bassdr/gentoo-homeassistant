# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library implementing a Zigbee stack"
HOMEPAGE="
  https://pypi.org/project/zigpy/
  repository, https://github.com/zigpy/zigpy
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	aiosqlite>=0.20.0
	async-timeout; python_version < "3.11"
	asynctest; extra == "testing"
	attrs
	coverage[toml]; extra == "testing"
	coveralls; extra == "testing"
	crccheck
	cryptography
	freezegun; extra == "testing"
	frozendict
	jsonschema
	pyserial-asyncio!=0.5; platform_system == "Windows"
	pyserial-asyncio; platform_system != "Windows"
	pysqlite3-binary; (platform_system == "Linux" and python_version < "3.12") and extra == "testing"
	pytest-asyncio; extra == "testing"
	pytest-cov; extra == "testing"
	pytest-timeout; extra == "testing"
	pytest; extra == "testing"
	tomli; extra == "testing"
	typing_extensions
	voluptuous
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/crccheck[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/frozendict[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	dev-python/crccheck[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/frozendict[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
