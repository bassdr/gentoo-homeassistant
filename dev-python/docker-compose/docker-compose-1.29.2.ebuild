# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="socks"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/docker-compose/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PySocks (!=1.5.7,<2,>=1.5.6) ; extra == 'socks'
	PyYAML (<6,>=3.10)
	backports.ssl-match-hostname (<4,>=3.5) ; python_version < "3.5"
	cached-property (<2,>=1.2.0) ; python_version < "3.8"
	colorama (<1,>=0.4) ; sys_platform == "win32"
	ddt (<2,>=1.2.2) ; extra == 'tests'
	distro (<2,>=1.5.0)
	docker[ssh] (>=5)
	dockerpty (<1,>=0.4.1)
	docopt (<1,>=0.6.1)
	jsonschema (<4,>=2.5.1)
	pytest (<6) ; extra == 'tests'
	python-dotenv (<1,>=0.13.0)
	requests (<3,>=2.20.0)
	texttable (<2,>=0.9.0)
	websocket-client (<1,>=0.32.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/distro-1.5.0[${PYTHON_USEDEP}] <dev-python/distro-2[${PYTHON_USEDEP}]
	>=dev-python/docker-5[ssh,${PYTHON_USEDEP}]
	>=dev-python/dockerpty-0.4.1[${PYTHON_USEDEP}] <dev-python/dockerpty-1[${PYTHON_USEDEP}]
	>=dev-python/docopt-0.6.1[${PYTHON_USEDEP}] <dev-python/docopt-1[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.5.1[${PYTHON_USEDEP}] <dev-python/jsonschema-4[${PYTHON_USEDEP}]
	socks? ( >=dev-python/pysocks-1.5.6[${PYTHON_USEDEP}] <dev-python/pysocks-2[${PYTHON_USEDEP}] !~dev-python/pysocks-1.5.7[${PYTHON_USEDEP}] )
	>=dev-python/python-dotenv-0.13.0[${PYTHON_USEDEP}] <dev-python/python-dotenv-1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] <dev-python/pyyaml-6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/texttable-0.9.0[${PYTHON_USEDEP}] <dev-python/texttable-2[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.32.0[${PYTHON_USEDEP}] <dev-python/websocket-client-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/ddt-1.2.2[${PYTHON_USEDEP}] <dev-python/ddt-2[${PYTHON_USEDEP}]
		<dev-python/pytest-6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
