# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-apache-hdfs/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/hdfs-2.5.4[avro,dataframe,kerberos,${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/hdfs-2.7.3[avro,dataframe,kerberos,${PYTHON_USEDEP}]' python3_13{,t})
	<dev-python/pandas-2.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
