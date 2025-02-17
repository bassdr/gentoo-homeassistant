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
REQUIRES_DIST="
	certifi>=2024.2.2
	cffi>=1.12.0
	charset-normalizer<4.0,>=3.3.2; extra == 'dev'
	charset-normalizer<4.0,>=3.3.2; extra == 'test'
	cibuildwheel; extra == 'build'
	coverage<7.0,>=6.4.1; extra == 'dev'
	cryptography<43.0,>=42.0.5; extra == 'dev'
	cryptography<43.0,>=42.0.5; extra == 'test'
	fastapi<1.0,==0.110.0; extra == 'test'
	httpx==0.23.1; extra == 'dev'
	httpx==0.23.1; extra == 'test'
	mypy<2.0,>=1.9.0; extra == 'dev'
	proxy.py<3.0,>=2.4.3; extra == 'test'
	pytest-asyncio<1.0,>=0.23.6; extra == 'dev'
	pytest-asyncio<1.0,>=0.23.6; extra == 'test'
	pytest-trio<1.0,>=0.8.0; extra == 'dev'
	pytest-trio<1.0,>=0.8.0; extra == 'test'
	pytest<9.0,>=8.1.1; extra == 'dev'
	pytest<9.0,>=8.1.1; extra == 'test'
	python-multipart<1.0,>=0.0.9; extra == 'test'
	ruff<1.0,>=0.3.5; extra == 'dev'
	trio<1.0,>=0.25.0; extra == 'dev'
	trio<1.0,>=0.25.0; extra == 'test'
	trustme<2.0,>=1.1.0; extra == 'dev'
	trustme<2.0,>=1.1.0; extra == 'test'
	typing-extensions
	uvicorn<1.0,>=0.29.0; extra == 'dev'
	uvicorn<1.0,>=0.29.0; extra == 'test'
	websockets<13.0,>=12.0; extra == 'dev'
	websockets<13.0,>=12.0; extra == 'test'
	wheel; extra == 'build'
"
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
		>=dev-python/charset-normalizer-3.3.2[${PYTHON_USEDEP}] <dev-python/charset-normalizer-4.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-6.4.1[${PYTHON_USEDEP}] <dev-python/coverage-7.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-42.0.5[${PYTHON_USEDEP}] <dev-python/cryptography-43.0[${PYTHON_USEDEP}]
		~dev-python/fastapi-0.110.0[${PYTHON_USEDEP}] <dev-python/fastapi-1.0[${PYTHON_USEDEP}]
		~dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.9.0[${PYTHON_USEDEP}] <dev-python/mypy-2.0[${PYTHON_USEDEP}]
		>=dev-python/proxy-py-2.4.3[${PYTHON_USEDEP}] <dev-python/proxy-py-3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.1.1[${PYTHON_USEDEP}] <dev-python/pytest-9.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.6[${PYTHON_USEDEP}] <dev-python/pytest-asyncio-1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-trio-0.8.0[${PYTHON_USEDEP}] <dev-python/pytest-trio-1.0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}] <dev-python/python-multipart-1.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.3.5[${PYTHON_USEDEP}] <dev-python/ruff-1.0[${PYTHON_USEDEP}]
		>=dev-python/trio-0.25.0[${PYTHON_USEDEP}] <dev-python/trio-1.0[${PYTHON_USEDEP}]
		>=dev-python/trustme-1.1.0[${PYTHON_USEDEP}] <dev-python/trustme-2.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.29.0[${PYTHON_USEDEP}] <dev-python/uvicorn-1.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}] <dev-python/websockets-13.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
