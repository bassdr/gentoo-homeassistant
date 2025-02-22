# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_SINGLE_IMPL=1
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
IUSE="${GENERATED_IUSE}"

DOCS="README.md"

REQUIRES_DIST="
	anyio<5,>=3.5.0
	boto3>=1.28.57; extra == 'bedrock'
	botocore>=1.31.57; extra == 'bedrock'
	cached-property; python_version < '3.8'
	distro<2,>=1.7.0
	google-auth<3,>=2; extra == 'vertex'
	httpx<1,>=0.23.0
	jiter<1,>=0.4.0
	pydantic<3,>=1.9.0
	sniffio
	tokenizers>=0.13.0
	typing-extensions<5,>=4.7
"
GENERATED_RDEPEND="${RDEPEND} $(python_gen_cond_dep '
	>=dev-python/anyio-3.5.0[${PYTHON_USEDEP}] <dev-python/anyio-5[${PYTHON_USEDEP}]
	bedrock? ( >=dev-python/boto3-1.28.57[${PYTHON_USEDEP}] )
	bedrock? ( >=dev-python/botocore-1.31.57[${PYTHON_USEDEP}] )
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}] <dev-python/distro-2[${PYTHON_USEDEP}]
	vertex? ( >=dev-python/google-auth-2[${PYTHON_USEDEP}] <dev-python/google-auth-3[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}]
	>=dev-python/jiter-0.4.0[${PYTHON_USEDEP}] <dev-python/jiter-1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}] <dev-python/pydantic-3[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	>=sci-libs/tokenizers-0.13.0[${PYTHON_SINGLE_USEDEP}]
')"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
