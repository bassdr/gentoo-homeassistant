# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A Python SOAP client"
HOMEPAGE="
  https://pypi.org/project/zeep/
  Repository, https://github.com/mvantellingen/python-zeep
  Documentation, https://docs.python-zeep.org
  Changelog, https://github.com/mvantellingen/python-zeep/blob/main/CHANGES
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async docs test xmlsec"
IUSE="${GENERATED_IUSE} +async"

REQUIRES_DIST="
	attrs>=17.2.0
	coverage[toml]==7.6.2; extra == 'test'
	flake8-blind-except==0.2.1; extra == 'test'
	flake8-debugger==4.1.2; extra == 'test'
	flake8-imports==0.1.1; extra == 'test'
	flake8==7.1.1; extra == 'test'
	freezegun==1.5.1; extra == 'test'
	httpx>=0.15.0; extra == 'async'
	isodate>=0.5.4
	isort==5.13.2; extra == 'test'
	lxml>=4.6.0
	platformdirs>=1.4.0
	pretend==1.0.9; extra == 'test'
	pytest-asyncio; extra == 'test'
	pytest-cov==5.0.0; extra == 'test'
	pytest-httpx; extra == 'test'
	pytest==8.3.3; extra == 'test'
	pytz
	requests-file>=1.5.1
	requests-mock==1.12.1; extra == 'test'
	requests-toolbelt>=0.7.1
	requests>=2.7.0
	sphinx>=1.4.0; extra == 'docs'
	xmlsec>=0.6.1; extra == 'xmlsec'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-17.2.0[${PYTHON_USEDEP}]
	async? ( >=dev-python/httpx-0.15.0[${PYTHON_USEDEP}] )
	>=dev-python/isodate-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-1.4.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/requests-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/requests-file-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.7.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.4.0[${PYTHON_USEDEP}] )
	xmlsec? ( >=dev-python/xmlsec-0.6.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-17.2.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/requests-file-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.7.1[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	async? ( >=dev-python/httpx-0.15.0[${PYTHON_USEDEP}] )
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/coverage-7.6.2[toml,${PYTHON_USEDEP}]
		~dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
		~dev-python/flake8-blind-except-0.2.1[${PYTHON_USEDEP}]
		~dev-python/flake8-debugger-4.1.2[${PYTHON_USEDEP}]
		~dev-python/flake8-imports-0.1.1[${PYTHON_USEDEP}]
		~dev-python/freezegun-1.5.1[${PYTHON_USEDEP}]
		~dev-python/isort-5.13.2[${PYTHON_USEDEP}]
		~dev-python/pretend-1.0.9[${PYTHON_USEDEP}]
		~dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.12.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.15.0[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/xmlsec[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
