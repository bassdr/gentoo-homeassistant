# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library to interface with the Hive API"
HOMEPAGE="
  https://pypi.org/project/pyhiveapi/
  Source, https://github.com/Pyhive/Pyhiveapi
  Issue tracker, https://github.com/Pyhive/Pyhiveapi/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.16.10[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.19.10[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/pyquery[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev-python/unasync[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pyquery[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/pyquery[${PYTHON_USEDEP}]
	dev-python/unasync[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
