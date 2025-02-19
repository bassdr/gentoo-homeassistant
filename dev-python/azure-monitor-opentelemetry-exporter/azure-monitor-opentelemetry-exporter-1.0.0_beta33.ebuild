# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 1.0.0b33)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-1.0.0b33"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-monitor-opentelemetry-exporter/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-core<2.0.0,>=1.28.0
	fixedint==0.1.6
	msrest>=0.6.10
	opentelemetry-api~=1.26
	opentelemetry-sdk~=1.26
	psutil~=5.9
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-core-1.28.0[${PYTHON_USEDEP}] <dev-python/azure-core-2.0.0[${PYTHON_USEDEP}]
	~dev-python/fixedint-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/msrest-0.6.10[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.26[${PYTHON_USEDEP}] =dev-python/opentelemetry-api-1*[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.26[${PYTHON_USEDEP}] =dev-python/opentelemetry-sdk-1*[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9[${PYTHON_USEDEP}] =dev-python/psutil-5*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
