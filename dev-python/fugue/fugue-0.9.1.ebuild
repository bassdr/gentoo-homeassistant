# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all cpp-sql-parser dask duckdb ibis notebook polars ray spark sql"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fugue/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	adagio>=0.2.4
	dask-sql; extra == 'all'
	dask[dataframe,distributed]>=2023.5.0; extra == 'all'
	dask[dataframe,distributed]>=2023.5.0; extra == 'dask'
	dask[dataframe,distributed]>=2024.4.0; python_version >= '3.11.9' and extra == 'dask'
	duckdb>=0.5.0; extra == 'all'
	duckdb>=0.5.0; extra == 'duckdb'
	duckdb>=0.5.0; extra == 'ray'
	fugue-sql-antlr>=0.2.0; extra == 'all'
	fugue-sql-antlr>=0.2.0; extra == 'duckdb'
	fugue-sql-antlr>=0.2.0; extra == 'ibis'
	fugue-sql-antlr>=0.2.0; extra == 'sql'
	fugue-sql-antlr[cpp]>=0.2.0; extra == 'cpp-sql-parser'
	ibis-framework; extra == 'all'
	ibis-framework; extra == 'ibis'
	ipython>=7.10.0; extra == 'all'
	ipython>=7.10.0; extra == 'notebook'
	jinja2; extra == 'all'
	jinja2; extra == 'duckdb'
	jinja2; extra == 'ibis'
	jinja2; extra == 'sql'
	jupyterlab; extra == 'all'
	jupyterlab; extra == 'notebook'
	notebook; extra == 'all'
	notebook; extra == 'notebook'
	numpy; extra == 'duckdb'
	pandas<2.2,>=2.0.2; extra == 'all'
	pandas<2.2; extra == 'ibis'
	pandas<2.2; extra == 'ray'
	pandas>=2.0.2; extra == 'dask'
	polars; extra == 'all'
	polars; extra == 'polars'
	pyarrow>=6.0.1; extra == 'all'
	pyarrow>=7.0.0; extra == 'dask'
	pyarrow>=7.0.0; extra == 'ray'
	pyspark>=3.1.1; extra == 'all'
	pyspark>=3.1.1; extra == 'spark'
	qpd>=0.4.4; extra == 'all'
	qpd>=0.4.4; extra == 'duckdb'
	qpd>=0.4.4; extra == 'ibis'
	qpd>=0.4.4; extra == 'sql'
	ray[data]>=2.5.0; extra == 'all'
	ray[data]>=2.5.0; extra == 'ray'
	sqlglot; extra == 'all'
	sqlglot; extra == 'duckdb'
	sqlglot; extra == 'ibis'
	sqlglot; extra == 'sql'
	triad>=0.9.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/adagio-0.2.4[${PYTHON_USEDEP}]
	all? ( >=dev-python/dask-2023.5.0[dataframe,distributed,${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2023.5.0[dataframe,distributed,${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2024.4.0[dataframe,distributed,${PYTHON_USEDEP}] )
	all? ( dev-python/dask-sql[${PYTHON_USEDEP}] )
	all? ( >=dev-python/duckdb-0.5.0[${PYTHON_USEDEP}] )
	duckdb? ( >=dev-python/duckdb-0.5.0[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/duckdb-0.5.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/fugue-sql-antlr-0.2.0[${PYTHON_USEDEP}] )
	cpp-sql-parser? ( >=dev-python/fugue-sql-antlr-0.2.0[cpp,${PYTHON_USEDEP}] )
	duckdb? ( >=dev-python/fugue-sql-antlr-0.2.0[${PYTHON_USEDEP}] )
	ibis? ( >=dev-python/fugue-sql-antlr-0.2.0[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/fugue-sql-antlr-0.2.0[${PYTHON_USEDEP}] )
	all? ( dev-python/ibis-framework[${PYTHON_USEDEP}] )
	ibis? ( dev-python/ibis-framework[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-7.10.0[${PYTHON_USEDEP}] )
	notebook? ( >=dev-python/ipython-7.10.0[${PYTHON_USEDEP}] )
	all? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	duckdb? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	ibis? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	sql? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	all? ( dev-python/jupyterlab[${PYTHON_USEDEP}] )
	notebook? ( dev-python/jupyterlab[${PYTHON_USEDEP}] )
	all? ( dev-python/notebook[${PYTHON_USEDEP}] )
	notebook? ( dev-python/notebook[${PYTHON_USEDEP}] )
	duckdb? ( dev-python/numpy[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pandas-2.0.2[${PYTHON_USEDEP}] <dev-python/pandas-2.2[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/pandas-2.0.2[${PYTHON_USEDEP}] )
	ibis? ( <dev-python/pandas-2.2[${PYTHON_USEDEP}] )
	ray? ( <dev-python/pandas-2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/polars[${PYTHON_USEDEP}] )
	polars? ( dev-python/polars[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyarrow-6.0.1[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/pyarrow-7.0.0[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pyarrow-7.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyspark-3.1.1[${PYTHON_USEDEP}] )
	spark? ( >=dev-python/pyspark-3.1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/qpd-0.4.4[${PYTHON_USEDEP}] )
	duckdb? ( >=dev-python/qpd-0.4.4[${PYTHON_USEDEP}] )
	ibis? ( >=dev-python/qpd-0.4.4[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/qpd-0.4.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ray-2.5.0[data,${PYTHON_USEDEP}] )
	ray? ( >=dev-python/ray-2.5.0[data,${PYTHON_USEDEP}] )
	all? ( dev-python/sqlglot[${PYTHON_USEDEP}] )
	duckdb? ( dev-python/sqlglot[${PYTHON_USEDEP}] )
	ibis? ( dev-python/sqlglot[${PYTHON_USEDEP}] )
	sql? ( dev-python/sqlglot[${PYTHON_USEDEP}] )
	>=dev-python/triad-0.9.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
