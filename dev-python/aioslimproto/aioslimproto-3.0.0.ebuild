# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Logitech Squeezebox players directly (without Logitech server)."
HOMEPAGE="
  https://pypi.org/project/aioslimproto/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/codespell-2.2.6[${PYTHON_USEDEP}]
		=dev-python/isort-5.13.2[${PYTHON_USEDEP}]
		=dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
		=dev-python/pre-commit-hooks-4.5.0[${PYTHON_USEDEP}]
		=dev-python/pytest-8.1.0[${PYTHON_USEDEP}]
		=dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		=dev-python/pytest-asyncio-0.23.5[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		=dev-python/ruff-0.3.0[${PYTHON_USEDEP}]
		=dev-python/safety-3.0.1[${PYTHON_USEDEP}]
		=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
		=dev-vcs/pre-commit-3.6.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
