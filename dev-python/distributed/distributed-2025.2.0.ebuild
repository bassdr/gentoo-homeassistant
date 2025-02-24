# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/distributed/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click>=8.0
	cloudpickle>=3.0.0
	dask==2025.2.0
	jinja2>=2.10.3
	locket>=1.0.0
	msgpack>=1.0.2
	packaging>=20.0
	psutil>=5.8.0
	pyyaml>=5.4.1
	sortedcontainers>=2.0.5
	tblib>=1.6.0
	toolz>=0.11.2
	tornado>=6.2.0
	urllib3>=1.26.5
	zict>=3.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
	~dev-python/dask-2025.2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.10.3[${PYTHON_USEDEP}]
	>=dev-python/locket-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.0.5[${PYTHON_USEDEP}]
	>=dev-python/tblib-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/toolz-0.11.2[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	>=dev-python/zict-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
