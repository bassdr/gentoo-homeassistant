# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Philips Hue."
HOMEPAGE="
  https://pypi.org/project/aiohue/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/asyncio-throttle[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/asyncio-throttle[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
	~dev-python/mypy-1.11.1[${PYTHON_USEDEP}]
	~dev-python/pre-commit-hooks-4.6.0[${PYTHON_USEDEP}]
	~dev-python/pylint-3.2.6[${PYTHON_USEDEP}]
	~dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
	~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.23.8[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	~dev-python/ruff-0.6.1[${PYTHON_USEDEP}]
	~dev-python/safety-3.2.5[${PYTHON_USEDEP}]
	~dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	~dev-vcs/pre-commit-3.8.0[${PYTHON_USEDEP}]
)"
