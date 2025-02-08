# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-http/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp!=3.11.0,>=3.9.2
	apache-airflow>=2.9.0
	asgiref>=2.3.0
	requests-toolbelt>=0.4.0
	requests<3,>=2.27.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}] !~dev-python/aiohttp-3.11.0[${PYTHON_USEDEP}]
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/asgiref-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27.0[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
