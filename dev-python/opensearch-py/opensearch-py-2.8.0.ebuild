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

GENERATED_DEPEND="${RDEPEND}
	async? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	docs? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
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
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	develop? ( <dev-python/requests-3.0.0[${PYTHON_USEDEP}] )
	kerberos? ( dev-python/requests-kerberos[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	!=dev-python/urllib3-2.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
