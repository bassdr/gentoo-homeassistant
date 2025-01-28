# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-apache-flink/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/apache-airflow-providers-cncf-kubernetes-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest