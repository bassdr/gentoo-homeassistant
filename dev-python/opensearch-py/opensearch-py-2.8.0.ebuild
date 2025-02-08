# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opensearch-py/"
SRC_URI="
	https://github.com/opensearch-project/opensearch-py/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async develop docs kerberos"
IUSE="${GENERATED_IUSE} test"

# Uses 156 GB of RAM for the test suite, needs more work.
RESTRICT="test"

REQUIRES_DIST="
	Events
	aiohttp<4,>=3.9.4; extra == "async"
	aiohttp<4,>=3.9.4; extra == "docs"
	black>=24.3.0; extra == "develop"
	botocore; extra == "develop"
	certifi>=2024.07.04
	coverage<8.0.0; extra == "develop"
	jinja2; extra == "develop"
	myst_parser; extra == "develop"
	myst_parser; extra == "docs"
	pytest-cov; extra == "develop"
	pytest-mock<4.0.0; extra == "develop"
	pytest>=3.0.0; extra == "develop"
	python-dateutil
	pytz; extra == "develop"
	pyyaml; extra == "develop"
	requests<3.0.0,>=2.0.0; extra == "develop"
	requests<3.0.0,>=2.32.0
	requests_kerberos; extra == "kerberos"
	sphinx; extra == "develop"
	sphinx; extra == "docs"
	sphinx_copybutton; extra == "develop"
	sphinx_copybutton; extra == "docs"
	sphinx_rtd_theme; extra == "develop"
	sphinx_rtd_theme; extra == "docs"
	urllib3!=2.2.0,!=2.2.1,<3,>=1.26.19; python_version >= "3.10"
	urllib3<1.27,>=1.26.19; python_version < "3.10"
"
GENERATED_RDEPEND="${RDEPEND}
	async? ( >=dev-python/aiohttp-3.9.4[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/aiohttp-3.9.4[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/black-24.3.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/botocore[${PYTHON_USEDEP}] )
	>=dev-python/certifi-2024.07.04[${PYTHON_USEDEP}]
	develop? ( <dev-python/coverage-8.0.0[${PYTHON_USEDEP}] )
	dev-python/events[${PYTHON_USEDEP}]
	develop? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	develop? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/pytest-3.0.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	develop? ( <dev-python/pytest-mock-4.0.0[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	develop? ( dev-python/pytz[${PYTHON_USEDEP}] )
	develop? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	develop? ( >=dev-python/requests-2.0.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}] )
	kerberos? ( dev-python/requests-kerberos[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.26.19[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}] !~dev-python/urllib3-2.2.0[${PYTHON_USEDEP}] !~dev-python/urllib3-2.2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/urllib3-1.26.19[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/events[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/botocore[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"
