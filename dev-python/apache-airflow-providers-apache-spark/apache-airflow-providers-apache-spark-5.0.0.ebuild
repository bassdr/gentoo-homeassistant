# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cncf-kubernetes common-compat"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-apache-spark/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	cncf-kubernetes? ( >=dev-python/apache-airflow-providers-cncf-kubernetes-7.4.0[${PYTHON_USEDEP}] )
	common-compat? ( dev-python/apache-airflow-providers-common-compat[${PYTHON_USEDEP}] )
	>=dev-python/grpcio-status-1.59.0[${PYTHON_USEDEP}]
	>=dev-python/pyspark-3.1.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
