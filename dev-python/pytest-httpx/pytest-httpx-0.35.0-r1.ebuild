# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-httpx/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	=dev-python/httpx-0.28*[${PYTHON_USEDEP}]
	=dev-python/pytest-8*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	=dev-python/httpx-0.28*[${PYTHON_USEDEP}]
	=dev-python/pytest-8*[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/pytest-asyncio-0.24*[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-6*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
