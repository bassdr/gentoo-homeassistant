# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 pypi

DESCRIPTION="Automation Library for Denon AVR receivers"
HOMEPAGE="
  https://pypi.org/project/denonavr/
  Homepage, https://github.com/ol-iver/denonavr
  Source, https://github.com/ol-iver/denonavr
  Tracker, https://github.com/ol-iver/denonavr/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	async-timeout>=4.0.2; python_version < '3.11'
	asyncstdlib>=3.10.2
	attrs>=21.2.0
	defusedxml>=0.7.1
	flake8-docstrings; extra == 'testing'
	flake8; extra == 'testing'
	ftfy>=6.1.1
	httpx>=0.23.1
	netifaces>=0.11.0
	pydocstyle; extra == 'testing'
	pylint; extra == 'testing'
	pytest-asyncio; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-httpx; extra == 'testing'
	pytest-timeout; extra == 'testing'
	pytest; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asyncstdlib-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/ftfy-6.1.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flake8-docstrings[${PYTHON_USEDEP}]
		dev-python/pydocstyle[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
