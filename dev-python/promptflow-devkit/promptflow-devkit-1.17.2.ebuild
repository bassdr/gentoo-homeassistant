# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="executable"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/promptflow-devkit/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/argcomplete-3.2.3[${PYTHON_USEDEP}]
	<dev-python/azure-monitor-opentelemetry-exporter-2.0.0[${PYTHON_USEDEP}]
	executable? ( dev-python/bs4[${PYTHON_USEDEP}] )
	<dev-python/colorama-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.4[${PYTHON_USEDEP}]
	<dev-python/filelock-4.0.0[${PYTHON_USEDEP}]
	<dev-python/flask-cors-6.0.0[${PYTHON_USEDEP}]
	<dev-python/flask-restx-2.0.0[${PYTHON_USEDEP}]
	<dev-python/gitpython-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.25.1[${PYTHON_USEDEP}]
	<dev-python/keyring-25.0.0[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4.0.0[${PYTHON_USEDEP}]
	<dev-python/opentelemetry-exporter-otlp-proto-http-2.0.0[${PYTHON_USEDEP}]
	<dev-python/pandas-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	<dev-python/promptflow-core-2.0.0[${PYTHON_USEDEP}]
	executable? ( <dev-python/pyarrow-15.0.0[${PYTHON_USEDEP}] )
	<dev-python/pydash-8.0.0[${PYTHON_USEDEP}]
	executable? ( >=dev-python/pyinstaller-5.13.2[${PYTHON_USEDEP}] )
	<dev-python/python-dotenv-2.0.0[${PYTHON_USEDEP}]
	dev-python/pywin32[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-3.0.0[${PYTHON_USEDEP}]
	executable? ( >=dev-python/streamlit-1.26.0[${PYTHON_USEDEP}] )
	executable? ( <dev-python/streamlit-quill-0.1.0[${PYTHON_USEDEP}] )
	<dev-python/strictyaml-2.0.0[${PYTHON_USEDEP}]
	<dev-python/tabulate-1.0.0[${PYTHON_USEDEP}]
	<dev-python/waitress-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest