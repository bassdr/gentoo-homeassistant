# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="The official Python library for the anthropic API"
HOMEPAGE="
  https://pypi.org/project/anthropic/
  Homepage, https://github.com/anthropics/anthropic-sdk-python
  Repository, https://github.com/anthropics/anthropic-sdk-python
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="bedrock vertex"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	<dev-python/anyio-5[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]
	bedrock? ( >=dev-python/boto3-1.28.57[${PYTHON_USEDEP}] )
	bedrock? ( >=dev-python/botocore-1.31.57[${PYTHON_USEDEP}] )
	dev-python/cached-property[${PYTHON_USEDEP}]
	<dev-python/distro-2[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	vertex? ( <dev-python/google-auth-3[${PYTHON_USEDEP}] )
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	<dev-python/jiter-1[${PYTHON_USEDEP}]
	dev-python/jiter[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	>=sci-libs/tokenizers-0.13.0[${PYTHON_USEDEP}]
	sci-libs/tokenizers[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	sci-libs/tokenizers[${PYTHON_USEDEP}]
	"
	# WIP: dev-python/jiter[${PYTHON_USEDEP}]

distutils_enable_tests pytest
