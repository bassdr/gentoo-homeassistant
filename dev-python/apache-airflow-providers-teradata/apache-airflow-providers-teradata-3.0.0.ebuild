# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="amazon microsoft-azure"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-teradata/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	amazon? ( dev-python/apache-airflow-providers-amazon[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	microsoft-azure? ( dev-python/apache-airflow-providers-microsoft-azure[${PYTHON_USEDEP}] )
	>=dev-python/teradatasql-17.20.0.28[${PYTHON_USEDEP}]
	>=dev-python/teradatasqlalchemy-17.20.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
