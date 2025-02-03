# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_EXT=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/curl-cffi/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="build"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/certifi-2024.2.2[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.12.0[${PYTHON_USEDEP}]
	build? ( dev-python/cibuildwheel[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	net-misc/curl-impersonate"

PATCHES=( "${FILESDIR}/${PN}-0001-system-libs.patch" )

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		<dev-python/charset-normalizer-4.0[${PYTHON_USEDEP}]
		<dev-python/coverage-7.0[${PYTHON_USEDEP}]
		<dev-python/cryptography-43.0[${PYTHON_USEDEP}]
		<dev-python/fastapi-1.0[${PYTHON_USEDEP}]
		=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
		<dev-python/mypy-2.0[${PYTHON_USEDEP}]
		<dev-python/proxy-py-3.0[${PYTHON_USEDEP}]
		<dev-python/pytest-9.0[${PYTHON_USEDEP}]
		<dev-python/pytest-asyncio-1.0[${PYTHON_USEDEP}]
		<dev-python/pytest-trio-1.0[${PYTHON_USEDEP}]
		<dev-python/python-multipart-1.0[${PYTHON_USEDEP}]
		<dev-python/ruff-1.0[${PYTHON_USEDEP}]
		<dev-python/trio-1.0[${PYTHON_USEDEP}]
		<dev-python/trustme-2.0[${PYTHON_USEDEP}]
		<dev-python/uvicorn-1.0[${PYTHON_USEDEP}]
		<dev-python/websockets-13.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
