# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="The official Python library for the openai API"
HOMEPAGE="
  https://pypi.org/project/openai/
  Homepage, https://github.com/openai/openai-python
  Repository, https://github.com/openai/openai-python
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="datalib"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	anyio<5,>=3.5.0
	cached-property; python_version < '3.8'
	distro<2,>=1.7.0
	httpx<1,>=0.23.0
	numpy>=1; extra == 'datalib'
	pandas-stubs>=1.1.0.11; extra == 'datalib'
	pandas>=1.2.3; extra == 'datalib'
	pydantic<3,>=1.9.0
	sniffio
	tqdm>4
	typing-extensions<5,>=4.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/anyio-3.5.0[${PYTHON_USEDEP}] <dev-python/anyio-5[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}] <dev-python/distro-2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}]
	datalib? ( >=dev-python/numpy-1[${PYTHON_USEDEP}] )
	datalib? ( >=dev-python/pandas-1.2.3[${PYTHON_USEDEP}] )
	datalib? ( >=dev-python/pandas-stubs-1.1.0.11[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}] <dev-python/pydantic-3[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	>dev-python/tqdm-4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
