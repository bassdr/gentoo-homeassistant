# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="kerberos"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-apache-impala/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	apache-airflow-providers-common-sql>=1.20.0
	apache-airflow>=2.9.0
	impyla<1.0,>=0.18.0
	kerberos>=1.3.0; extra == 'kerberos'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/impyla-0.18.0[${PYTHON_USEDEP}] <dev-python/impyla-1.0[${PYTHON_USEDEP}]
	kerberos? ( >=dev-python/kerberos-1.3.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
