# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="SoCo (Sonos Controller) is a simple library to control Sonos speakers."
HOMEPAGE="
  https://pypi.org/project/soco/
  Homepage, https://github.com/SoCo/SoCo
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="events-asyncio test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp; extra == 'events-asyncio'
	appdirs
	black>=22.12.0; python_version >= '3.7' and extra == 'testing'
	coveralls; extra == 'testing'
	flake8; extra == 'testing'
	graphviz; extra == 'testing'
	ifaddr
	importlib-metadata<5; python_version == '3.7' and extra == 'testing'
	lxml
	pylint; extra == 'testing'
	pytest-cov<2.6.0; extra == 'testing'
	pytest>=2.5; extra == 'testing'
	requests
	requests-mock; extra == 'testing'
	sphinx-rtd-theme; extra == 'testing'
	sphinx==4.5.0; extra == 'testing'
	twine; extra == 'testing'
	wheel; extra == 'testing'
	xmltodict
"
GENERATED_RDEPEND="${RDEPEND}
	events-asyncio? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-22.12.0[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/graphviz[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.5[${PYTHON_USEDEP}]
		<dev-python/pytest-cov-2.6.0[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		~dev-python/sphinx-4.5.0[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
