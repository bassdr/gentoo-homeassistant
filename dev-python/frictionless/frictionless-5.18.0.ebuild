# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="aws bigquery ckan datasette duckdb excel github gsheets html json mysql ods pandas parquet postgresql spss sql visidata wkt zenodo"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/frictionless/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	aws? ( >=dev-python/boto3-1.9[${PYTHON_USEDEP}] )
	>=dev-python/chardet-3.0[${PYTHON_USEDEP}]
	datasette? ( >=dev-python/datasette-0.64.2[${PYTHON_USEDEP}] )
	duckdb? ( >=dev-python/duckdb-0.8[${PYTHON_USEDEP}] )
	duckdb? ( >=dev-python/duckdb-engine-0.7[${PYTHON_USEDEP}] )
	ods? ( >=dev-python/ezodf-0.3[${PYTHON_USEDEP}] )
	parquet? ( >=dev-python/fastparquet-0.8[${PYTHON_USEDEP}] )
	ckan? ( >=dev-python/frictionless-ckan-mapper-1.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-api-python-client-1.12.1[${PYTHON_USEDEP}] )
	>=dev-python/humanize-4.2[${PYTHON_USEDEP}]
	json? ( >=dev-python/ijson-3.0[${PYTHON_USEDEP}] )
	>=dev-python/isodate-0.6[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	json? ( >=dev-python/jsonlines-1.2[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-4.20[${PYTHON_USEDEP}]
	ods? ( >=dev-python/lxml-4.0[${PYTHON_USEDEP}] )
	>=dev-python/marko-1.0[${PYTHON_USEDEP}]
	excel? ( >=dev-python/openpyxl-3.0[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pandas-1.0[${PYTHON_USEDEP}] )
	>=dev-python/petl-1.6[${PYTHON_USEDEP}]
	postgresql? ( >=dev-python/psycopg-3.0[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/psycopg2-2.9[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pyarrow-14.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	github? ( >=dev-python/pygithub-1.50[${PYTHON_USEDEP}] )
	gsheets? ( >=dev-python/pygsheets-2.0[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/pymysql-1.0[${PYTHON_USEDEP}] )
	html? ( >=dev-python/pyquery-1.4[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	zenodo? ( >=dev-python/pyzenodo3-1.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.10[${PYTHON_USEDEP}]
	>=dev-python/rfc3986-1.4[${PYTHON_USEDEP}]
	spss? ( >=dev-python/savreaderwriter-3.0[${PYTHON_USEDEP}] )
	>=dev-python/simpleeval-0.9.11[${PYTHON_USEDEP}]
	duckdb? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	>=dev-python/stringcase-1.2[${PYTHON_USEDEP}]
	excel? ( >=dev-python/tableschema-to-template-0.0[${PYTHON_USEDEP}] )
	>=dev-python/tabulate-0.8.10[${PYTHON_USEDEP}]
	wkt? ( >=dev-python/tatsu-5.8.3[${PYTHON_USEDEP}] )
	>=dev-python/typer-0.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}]
	>=dev-python/validators-0.18[${PYTHON_USEDEP}]
	visidata? ( >=dev-python/visidata-2.10[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/xlrd-1.2[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/xlwt-1.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/hatch[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/livemark[${PYTHON_USEDEP}]
	dev-python/moto[${PYTHON_USEDEP}]
	dev-python/neovim[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	~dev-python/pyright-1.1.317[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-dotenv[${PYTHON_USEDEP}]
	dev-python/pytest-lazy-fixtures[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-python/pytest-vcr[${PYTHON_USEDEP}]
	dev-python/requests-mock[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
	dev-python/yattag[${PYTHON_USEDEP}]
)"
