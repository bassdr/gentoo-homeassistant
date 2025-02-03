# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="common-compat openlineage"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-common-io/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	common-compat? ( dev-python/apache-airflow-providers-common-compat[${PYTHON_USEDEP}] )
	openlineage? ( dev-python/apache-airflow-providers-openlineage[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
