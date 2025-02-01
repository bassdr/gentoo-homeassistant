# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/elevenlabs/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/httpx-0.21.2[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	<dev-python/pydantic-core-3.0.0[${PYTHON_USEDEP}]
	dev-python/pydantic-core[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/httpx-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-core-2.18.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
