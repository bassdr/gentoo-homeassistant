# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="jmespath oauth openid talisman"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="Flask-AppBuilder"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-appbuilder/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/apispec-7[yaml,${PYTHON_USEDEP}]
	oauth? ( <dev-python/authlib-2.0.0[${PYTHON_USEDEP}] )
	<dev-python/click-9[${PYTHON_USEDEP}]
	<dev-python/colorama-1[${PYTHON_USEDEP}]
	>=dev-python/email-validator-1.0.5[${PYTHON_USEDEP}]
	<dev-python/flask-3.0.0[${PYTHON_USEDEP}]
	<dev-python/flask-babel-3[${PYTHON_USEDEP}]
	<dev-python/flask-jwt-extended-5.0.0[${PYTHON_USEDEP}]
	<dev-python/flask-limiter-4[${PYTHON_USEDEP}]
	<dev-python/flask-login-0.7[${PYTHON_USEDEP}]
	openid? ( <dev-python/flask-openid-2[${PYTHON_USEDEP}] )
	<dev-python/flask-sqlalchemy-3[${PYTHON_USEDEP}]
	talisman? ( <dev-python/flask-talisman-2.0[${PYTHON_USEDEP}] )
	<dev-python/flask-wtf-2[${PYTHON_USEDEP}]
	jmespath? ( >=dev-python/jmespath-0.9.5[${PYTHON_USEDEP}] )
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4[${PYTHON_USEDEP}]
	<dev-python/marshmallow-sqlalchemy-0.29.0[${PYTHON_USEDEP}]
	<dev-python/prison-1.0.0[${PYTHON_USEDEP}]
	<dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	<dev-python/python-dateutil-3[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-1.5[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-utils-1[${PYTHON_USEDEP}]
	<dev-python/werkzeug-4[${PYTHON_USEDEP}]
	<dev-python/wtforms-4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
