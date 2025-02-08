# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="debug graphql http validation"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/datamodel-code-generator/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	argcomplete<4,>=2.10.1
	black>=19.10b0
	genson<2,>=1.2.1
	graphql-core>=3.2.3; extra == "graphql"
	httpx>=0.24.1; extra == "http"
	inflect<6,>=4.1
	isort<7,>=4.3.21
	jinja2<4,>=2.10.1
	openapi-spec-validator<0.7,>=0.2.8; extra == "validation"
	packaging
	prance>=0.18.2; extra == "validation"
	pydantic>=1.5
	pysnooper<2,>=0.4.1; extra == "debug"
	pyyaml>=6.0.1
	tomli<3,>=2.2.1; python_version <= "3.11"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/argcomplete-2.10.1[${PYTHON_USEDEP}] <dev-python/argcomplete-4[${PYTHON_USEDEP}]
	>=dev-python/black-19.10_beta0[${PYTHON_USEDEP}]
	>=dev-python/genson-1.2.1[${PYTHON_USEDEP}] <dev-python/genson-2[${PYTHON_USEDEP}]
	graphql? ( >=dev-python/graphql-core-3.2.3[${PYTHON_USEDEP}] )
	http? ( >=dev-python/httpx-0.24.1[${PYTHON_USEDEP}] )
	>=dev-python/inflect-4.1[${PYTHON_USEDEP}] <dev-python/inflect-6[${PYTHON_USEDEP}]
	>=dev-python/isort-4.3.21[${PYTHON_USEDEP}] <dev-python/isort-7[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.10.1[${PYTHON_USEDEP}] <dev-python/jinja2-4[${PYTHON_USEDEP}]
	validation? ( >=dev-python/openapi-spec-validator-0.2.8[${PYTHON_USEDEP}] <dev-python/openapi-spec-validator-0.7[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	validation? ( >=dev-python/prance-0.18.2[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-1.5[${PYTHON_USEDEP}]
	debug? ( >=dev-python/pysnooper-0.4.1[${PYTHON_USEDEP}] <dev-python/pysnooper-2[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
