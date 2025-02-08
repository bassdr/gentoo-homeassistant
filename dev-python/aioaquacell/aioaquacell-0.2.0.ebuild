# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous library to retrieve details of your Aquacell water softener device"
HOMEPAGE="
  https://pypi.org/project/aioaquacell/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiobotocore
	aiohttp
	attr
	aws_request_signer
	boto3
	botocore
	pycognito
	requests_aws4auth
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiobotocore[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/attr[${PYTHON_USEDEP}]
	dev-python/aws-request-signer[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/pycognito[${PYTHON_USEDEP}]
	dev-python/requests-aws4auth[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests-aws4auth[${PYTHON_USEDEP}]
	dev-python/pycognito[${PYTHON_USEDEP}]
	dev-python/aws-request-signer[${PYTHON_USEDEP}]
	dev-python/aiobotocore[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
