# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all standard"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastapi/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/email-validator-2.0.0[${PYTHON_USEDEP}] )
	standard? ( >=dev-python/email-validator-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/fastapi-cli-0.0.5[standard,${PYTHON_USEDEP}] )
	standard? ( >=dev-python/fastapi-cli-0.0.5[standard,${PYTHON_USEDEP}] )
	all? ( >=dev-python/httpx-0.23.0[${PYTHON_USEDEP}] )
	standard? ( >=dev-python/httpx-0.23.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/itsdangerous-1.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}] )
	standard? ( >=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/orjson-3.2.1[${PYTHON_USEDEP}] )
	!=dev-python/pydantic-1.8[${PYTHON_USEDEP}]
	all? ( >=dev-python/pydantic-extra-types-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}] )
	standard? ( >=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}] )
	<dev-python/starlette-0.46.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	all? ( !=dev-python/ujson-4.0.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/uvicorn-0.12.0[standard,${PYTHON_USEDEP}] )
	standard? ( >=dev-python/uvicorn-0.12.0[standard,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
