# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="adlfs daft duckdb dynamodb gcsfs glue hive pandas pyarrow ray s3fs snappy sql-postgres sql-sqlite zstandard"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyiceberg/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	adlfs>=2023.1.0; extra == "adlfs"
	boto3>=1.24.59; extra == "glue" or extra == "dynamodb"
	cachetools<6.0.0,>=5.5.0
	click<9.0.0,>=7.1.1
	duckdb<2.0.0,>=0.5.0; extra == "duckdb"
	fsspec>=2023.1.0
	gcsfs>=2023.1.0; extra == "gcsfs"
	getdaft>=0.2.12; extra == "daft"
	mmh3<6.0.0,>=4.0.0
	mypy-boto3-glue>=1.28.18; extra == "glue"
	pandas<3.0.0,>=1.0.0; extra == "pandas" or extra == "ray"
	psycopg2-binary>=2.9.6; extra == "sql-postgres"
	pyarrow<19.0.0,>=14.0.0; extra == "pyarrow" or extra == "pandas" or extra == "duckdb" or extra == "ray"
	pydantic!=2.4.0,!=2.4.1,<3.0,>=2.0
	pyparsing<4.0.0,>=3.1.0
	python-snappy<1.0.0,>=0.6.0; extra == "snappy"
	ray<3.0.0,>=2.10.0; python_version >= "3.9" and extra == "ray"
	ray==2.10.0; python_version < "3.9" and extra == "ray"
	requests<3.0.0,>=2.20.0
	rich<14.0.0,>=10.11.0
	s3fs>=2023.1.0; extra == "s3fs"
	sortedcontainers==2.4.0
	sqlalchemy<3.0.0,>=2.0.18; extra == "sql-postgres" or extra == "sql-sqlite"
	strictyaml<2.0.0,>=1.7.0
	tenacity<10.0.0,>=8.2.3
	thrift<1.0.0,>=0.13.0; extra == "hive"
	zstandard<1.0.0,>=0.13.0; extra == "zstandard"
"
GENERATED_RDEPEND="${RDEPEND}
	adlfs? ( >=dev-python/adlfs-2023.1.0[${PYTHON_USEDEP}] )
	glue? ( >=dev-python/boto3-1.24.59[${PYTHON_USEDEP}] ) dynamodb? ( >=dev-python/boto3-1.24.59[${PYTHON_USEDEP}] )
	>=dev-python/cachetools-5.5.0[${PYTHON_USEDEP}] <dev-python/cachetools-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.1[${PYTHON_USEDEP}] <dev-python/click-9.0.0[${PYTHON_USEDEP}]
	duckdb? ( >=dev-python/duckdb-0.5.0[${PYTHON_USEDEP}] <dev-python/duckdb-2.0.0[${PYTHON_USEDEP}] )
	>=dev-python/fsspec-2023.1.0[${PYTHON_USEDEP}]
	gcsfs? ( >=dev-python/gcsfs-2023.1.0[${PYTHON_USEDEP}] )
	daft? ( >=dev-python/getdaft-0.2.12[${PYTHON_USEDEP}] )
	>=dev-python/mmh3-4.0.0[${PYTHON_USEDEP}] <dev-python/mmh3-6.0.0[${PYTHON_USEDEP}]
	glue? ( >=dev-python/mypy-boto3-glue-1.28.18[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] ) pandas? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	sql-postgres? ( >=dev-python/psycopg2-binary-2.9.6[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}] <dev-python/pyarrow-19.0.0[${PYTHON_USEDEP}] ) pandas? ( >=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}] <dev-python/pyarrow-19.0.0[${PYTHON_USEDEP}] ) duckdb? ( >=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}] <dev-python/pyarrow-19.0.0[${PYTHON_USEDEP}] ) pyarrow? ( >=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}] <dev-python/pyarrow-19.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}] <dev-python/pydantic-3.0[${PYTHON_USEDEP}] !~dev-python/pydantic-2.4.0[${PYTHON_USEDEP}] !~dev-python/pydantic-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.1.0[${PYTHON_USEDEP}] <dev-python/pyparsing-4.0.0[${PYTHON_USEDEP}]
	snappy? ( >=dev-python/python-snappy-0.6.0[${PYTHON_USEDEP}] <dev-python/python-snappy-1.0.0[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/ray-2.10.0[${PYTHON_USEDEP}] <dev-python/ray-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/rich-10.11.0[${PYTHON_USEDEP}] <dev-python/rich-14.0.0[${PYTHON_USEDEP}]
	s3fs? ( >=dev-python/s3fs-2023.1.0[${PYTHON_USEDEP}] )
	~dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	sql-sqlite? ( >=dev-python/sqlalchemy-2.0.18[${PYTHON_USEDEP}] <dev-python/sqlalchemy-3.0.0[${PYTHON_USEDEP}] ) sql-postgres? ( >=dev-python/sqlalchemy-2.0.18[${PYTHON_USEDEP}] <dev-python/sqlalchemy-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/strictyaml-1.7.0[${PYTHON_USEDEP}] <dev-python/strictyaml-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}] <dev-python/tenacity-10.0.0[${PYTHON_USEDEP}]
	hive? ( >=dev-python/thrift-0.13.0[${PYTHON_USEDEP}] <dev-python/thrift-1.0.0[${PYTHON_USEDEP}] )
	zstandard? ( >=dev-python/zstandard-0.13.0[${PYTHON_USEDEP}] <dev-python/zstandard-1.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
