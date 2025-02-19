# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async Python client to interact with internal OverKiz API (e.g. used by Somfy TaHoma)."
HOMEPAGE="
  https://pypi.org/project/pyoverkiz/
  Repository, https://github.com/iMicknl/python-overkiz-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.10.3
	attrs<25.0,>=21.2
	backoff<3.0,>=1.10.0
	backports-strenum<2.0.0,>=1.2.4; python_version < '3.11'
	boto3<2.0.0,>=1.18.59
	pyhumps<4.0.0,>=3.8.0
	warrant-lite<2.0.0,>=1.0.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.10.3[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.2[${PYTHON_USEDEP}] <dev-python/attrs-25.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}] <dev-python/backoff-3.0[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.18.59[${PYTHON_USEDEP}] <dev-python/boto3-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyhumps-3.8.0[${PYTHON_USEDEP}] <dev-python/pyhumps-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/warrant-lite-1.0.4[${PYTHON_USEDEP}] <dev-python/warrant-lite-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
