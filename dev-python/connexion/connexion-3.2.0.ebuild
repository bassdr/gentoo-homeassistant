# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="flask mock swagger-ui uvicorn"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/connexion/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	flask? ( >=dev-python/a2wsgi-1.7[${PYTHON_USEDEP}] )
	>=dev-python/asgiref-3.4[${PYTHON_USEDEP}]
	flask? ( >=dev-python/flask-2.2[async,${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.23[${PYTHON_USEDEP}]
	>=dev-python/inflection-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	mock? ( >=dev-python/jsf-0.10.0[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-4.17.3[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.15[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.35[${PYTHON_USEDEP}]
	swagger-ui? ( >=dev-python/swagger-ui-bundle-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.6.1[${PYTHON_USEDEP}]
	uvicorn? ( >=dev-python/uvicorn-0.17.6[standard,${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-2.2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
