# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-cloudant/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	apache-airflow>=2.9.0
	ibmcloudant==0.9.1; python_version >= '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	~dev-python/ibmcloudant-0.9.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
