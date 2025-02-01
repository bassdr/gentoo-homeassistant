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
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cffi-1.12.0[${PYTHON_USEDEP}]
	build? ( dev-python/cibuildwheel[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	net-misc/curl-impersonate"

PATCHES=( "${FILESDIR}/${PN}-0001-system-libs.patch" )

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/autoflake-1.4[${PYTHON_USEDEP}]
	~dev-python/black-22.8.0[${PYTHON_USEDEP}]
	~dev-python/coverage-6.4.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-38.0.3[${PYTHON_USEDEP}]
	~dev-python/cryptography-38.0.3[${PYTHON_USEDEP}]
	~dev-python/flake8-6.0.0[${PYTHON_USEDEP}]
	~dev-python/flake8-bugbear-22.7.1[${PYTHON_USEDEP}]
	~dev-python/flake8-pie-0.15.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	~dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	~dev-python/isort-5.10.1[${PYTHON_USEDEP}]
	~dev-python/mypy-0.971[${PYTHON_USEDEP}]
	~dev-python/pytest-7.1.2[${PYTHON_USEDEP}]
	~dev-python/pytest-7.1.2[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}]
	~dev-python/pytest-trio-0.7.0[${PYTHON_USEDEP}]
	~dev-python/pytest-trio-0.7.0[${PYTHON_USEDEP}]
	~dev-python/trio-0.21.0[${PYTHON_USEDEP}]
	~dev-python/trio-0.21.0[${PYTHON_USEDEP}]
	~dev-python/trio-typing-0.7.0[${PYTHON_USEDEP}]
	~dev-python/trio-typing-0.7.0[${PYTHON_USEDEP}]
	~dev-python/trustme-0.9.0[${PYTHON_USEDEP}]
	~dev-python/trustme-0.9.0[${PYTHON_USEDEP}]
	~dev-python/types-certifi-2021.10.8.2[${PYTHON_USEDEP}]
	~dev-python/types-certifi-2021.10.8.2[${PYTHON_USEDEP}]
	~dev-python/uvicorn-0.18.3[${PYTHON_USEDEP}]
	~dev-python/uvicorn-0.18.3[${PYTHON_USEDEP}]
)"
