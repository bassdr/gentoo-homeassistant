# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

VIRTUALX_REQUIRED="manual"

inherit distutils-r1 optfeature pypi virtualx

DESCRIPTION="Powerful data structures for data analysis, time series, and statistics"
HOMEPAGE="
  https://pypi.org/project/pandas/
  Homepage, https://pandas.pydata.org
  Documentation, https://pandas.pydata.org/docs/
  Repository, https://github.com/pandas-dev/pandas
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all aws clipboard compression computation consortium-standard excel feather fss gcp hdf5 html mysql output-formatting parquet performance plot postgresql pyarrow spss sql-other test xml"
IUSE="${GENERATED_IUSE} big-endian full-support minimal test X"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	all? ( >=dev-python/adbc-driver-postgresql-0.8.0[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/adbc-driver-postgresql-0.8.0[${PYTHON_USEDEP}] )
	sql-other? ( >=dev-python/adbc-driver-postgresql-0.8.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/adbc-driver-sqlite-0.8.0[${PYTHON_USEDEP}] )
	sql-other? ( >=dev-python/adbc-driver-sqlite-0.8.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/beautifulsoup4-4.11.2[${PYTHON_USEDEP}] )
	html? ( >=dev-python/beautifulsoup4-4.11.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/bottleneck-1.3.6[${PYTHON_USEDEP}] )
	performance? ( >=dev-python/bottleneck-1.3.6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/dataframe-api-compat-0.1.7[${PYTHON_USEDEP}] )
	consortium-standard? ( >=dev-python/dataframe-api-compat-0.1.7[${PYTHON_USEDEP}] )
	all? ( >=dev-python/fastparquet-2022.12.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/fsspec-2022.11.0[${PYTHON_USEDEP}] )
	fss? ( >=dev-python/fsspec-2022.11.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/gcsfs-2022.11.0[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/gcsfs-2022.11.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/html5lib-1.1[${PYTHON_USEDEP}] )
	html? ( >=dev-python/html5lib-1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/hypothesis-6.46.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/hypothesis-6.46.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}] )
	output-formatting? ( >=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/lxml-4.9.2[${PYTHON_USEDEP}] )
	html? ( >=dev-python/lxml-4.9.2[${PYTHON_USEDEP}] )
	xml? ( >=dev-python/lxml-4.9.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/matplotlib-3.6.3[${PYTHON_USEDEP}] )
	plot? ( >=dev-python/matplotlib-3.6.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/numba-0.56.4[${PYTHON_USEDEP}] )
	performance? ( >=dev-python/numba-0.56.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/numexpr-2.8.4[${PYTHON_USEDEP}] )
	performance? ( >=dev-python/numexpr-2.8.4[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_13{,t})
	dev-python/numpy[${PYTHON_USEDEP}]
	all? ( >=dev-python/odfpy-1.4.1[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/odfpy-1.4.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pandas-gbq-0.19.0[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/pandas-gbq-0.19.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/psycopg2-2.9.6[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/psycopg2-2.9.6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	feather? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	parquet? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	pyarrow? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pymysql-1.0.2[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/pymysql-1.0.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyqt5-5.15.9[${PYTHON_USEDEP}] )
	clipboard? ( >=dev-python/pyqt5-5.15.9[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyreadstat-1.2.0[${PYTHON_USEDEP}] )
	spss? ( >=dev-python/pyreadstat-1.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-7.3.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-7.3.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-xdist-2.2.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-xdist-2.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/python-calamine-0.1.7[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/python-calamine-0.1.7[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyxlsb-1.0.10[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/pyxlsb-1.0.10[${PYTHON_USEDEP}] )
	all? ( >=dev-python/qtpy-2.3.0[${PYTHON_USEDEP}] )
	clipboard? ( >=dev-python/qtpy-2.3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/s3fs-2022.11.0[${PYTHON_USEDEP}] )
	aws? ( >=dev-python/s3fs-2022.11.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/scipy-1.10.0[${PYTHON_USEDEP}] )
	computation? ( >=dev-python/scipy-1.10.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	sql-other? ( >=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tables-3.8.0[${PYTHON_USEDEP}] )
	hdf5? ( >=dev-python/tables-3.8.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}] )
	output-formatting? ( >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}] )
	>=dev-python/tzdata-2022.7[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
	all? ( >=dev-python/xarray-2022.12.0[${PYTHON_USEDEP}] )
	computation? ( >=dev-python/xarray-2022.12.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/xlrd-2.0.1[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/xlrd-2.0.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/xlsxwriter-3.0.5[${PYTHON_USEDEP}] )
	excel? ( >=dev-python/xlsxwriter-3.0.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/zstandard-0.19.0[${PYTHON_USEDEP}] )
	compression? ( >=dev-python/zstandard-0.19.0[${PYTHON_USEDEP}] )
"
RECOMMENDED_DEPEND="
	>=dev-python/bottleneck-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/numexpr-2.8.0[${PYTHON_USEDEP}]
"

# TODO: add pandas-gbq to the tree
# TODO: Re-add dev-python/statsmodel[python3_11] dep once it supports python3_11
# https://github.com/statsmodels/statsmodels/issues/8287
OPTIONAL_DEPEND="
	>=dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}]
	dev-python/blosc[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.0.7[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.36[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.10[${PYTHON_USEDEP}]
	>=dev-python/xarray-2022.3.0[${PYTHON_USEDEP}]
	>=dev-python/xlrd-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/xlwt-1.3.0[${PYTHON_USEDEP}]
	!arm? ( !hppa? ( !ppc? ( !x86? (
		>=dev-python/scipy-1.8.1[${PYTHON_USEDEP}]
		dev-python/statsmodels[${PYTHON_USEDEP}]
	) ) ) )
	!big-endian? (
		>=dev-python/tables-3.7.0[${PYTHON_USEDEP}]
	)
	X? (
		|| (
			>=dev-python/pyqt5-5.15.6[${PYTHON_USEDEP}]
			>=dev-python/qtpy-2.2.0[${PYTHON_USEDEP}]
			x11-misc/xclip
			x11-misc/xsel
		)
	)
"
DEPEND="
	>=dev-python/numpy-1.23.2:=[${PYTHON_USEDEP}]
"
COMMON_DEPEND="
	${DEPEND}
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
"
BDEPEND="
	${COMMON_DEPEND}
	>=dev-build/meson-1.2.1
	>=dev-python/cython-3.0.5[${PYTHON_USEDEP}]
	>=dev-python/versioneer-0.28[${PYTHON_USEDEP}]
	test? (
		${VIRTUALX_DEPEND}
		${RECOMMENDED_DEPEND}
		${OPTIONAL_DEPEND}
		dev-libs/apache-arrow[brotli,parquet,snappy]
		>=dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.46.1[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.0.10[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-10.0.1[parquet,${PYTHON_USEDEP}]
		>=dev-python/pymysql-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/xlsxwriter-3.0.3[${PYTHON_USEDEP}]
		x11-misc/xclip
		x11-misc/xsel
	)
"
RDEPEND="${GENERATED_DEPEND}
	${COMMON_DEPEND}
	dev-python/tzdata[${PYTHON_USEDEP}]
	!minimal? ( ${RECOMMENDED_DEPEND} )
	full-support? ( ${OPTIONAL_DEPEND} )
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# test for rounding errors, fails if we have better precision
		# e.g. on amd64 with FMA or on arm64
		# https://github.com/pandas-dev/pandas/issues/38921
		tests/window/test_rolling.py::test_rolling_var_numerical_issues

		# TODO; unhappy about DISPLAY?
		tests/test_downstream.py::test_seaborn

		# OOMs
		tests/io/parser/test_c_parser_only.py::test_bytes_exceed_2gb

		# TODO: numexpr says "forbidden control characters"
		tests/computation/test_eval.py::TestOperations::test_multi_line_expression_local_variable
		'tests/computation/test_eval.py::test_query_token[numexpr-Temp(\xb0C)]'
		tests/frame/test_query_eval.py::TestDataFrameQueryBacktickQuoting::test_lots_of_operators_string
		tests/frame/test_query_eval.py::TestDataFrameQueryBacktickQuoting::test_multiple_spaces
		tests/frame/test_query_eval.py::TestDataFrameQueryBacktickQuoting::test_parenthesis
		tests/frame/test_query_eval.py::TestDataFrameQueryBacktickQuoting::test_start_with_spaces
		tests/frame/test_query_eval.py::TestDataFrameQueryNumExprPandas::test_local_syntax
		tests/frame/test_query_eval.py::TestDataFrameQueryNumExprPandas::test_local_variable_with_in
		tests/frame/test_query_eval.py::TestDataFrameQueryNumExprPandas::test_nested_scope
		tests/frame/test_query_eval.py::TestDataFrameQueryNumExprPandas::test_query_scope

		# TODO: missing data not covered by --no-strict-data-files?
		tests/io/xml/test_xml.py::test_empty_stylesheet
		tests/io/xml/test_xml.py::test_wrong_file_path

		# TODO
		tests/frame/test_arithmetic.py::TestFrameFlexArithmetic::test_floordiv_axis0_numexpr_path

		# deprecation warning
		tests/io/pytables/test_retain_attributes.py::test_retain_index_attributes2
		'tests/computation/test_eval.py::TestEval::test_scalar_unary[numexpr-pandas]'

		# Needs 64-bit time_t (TODO: split into 32-bit arch only section)
		tests/tseries/offsets/test_year.py::test_add_out_of_pydatetime_range
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BusinessDay]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BusinessHour]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BusinessMonthEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BusinessMonthBegin]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BQuarterEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-BQuarterBegin]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-CustomBusinessDay]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-CustomBusinessHour]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-CustomBusinessMonthEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-CustomBusinessMonthBegin]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-MonthEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-MonthBegin]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-SemiMonthBegin]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-SemiMonthEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-QuarterEnd]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-LastWeekOfMonth]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-WeekOfMonth]'
		'tests/tseries/offsets/test_common.py::test_apply_out_of_range[tzlocal()-Week]'

		# hdf / pytables have alignment problems: bug #911660
		# https://github.com/pandas-dev/pandas/issues/54396
		tests/io/pytables/test_append.py::test_append_frame_column_oriented
		tests/io/pytables/test_store.py::test_select_filter_corner

		# blosc2 version
		tests/io/pytables/test_file_handling.py::test_complibs\[blosc2-{1..9}\]

		# requires -Werror
		tests/tslibs/test_to_offset.py::test_to_offset_lowercase_frequency_deprecated
		tests/tslibs/test_to_offset.py::test_to_offset_uppercase_frequency_deprecated

		# assumes that it will fail due to -mfpmath=387 on 32-bit arches,
		# so it XPASS-es in every other scenario
		tests/tools/test_to_timedelta.py::TestTimedeltas::test_to_timedelta_float

		# newer matplotlib?
		tests/plotting/frame/test_frame.py::TestDataFramePlots::test_group_subplot_invalid_column_name
	)

	if ! has_version "dev-python/scipy[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/plotting/test_misc.py::test_savefig
		)
	fi

	if has_version ">=dev-python/numexpr-2.10[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			'tests/computation/test_eval.py::TestTypeCasting::test_binop_typecasting[numexpr-python-left_right0-float64-/]'
			'tests/computation/test_eval.py::TestTypeCasting::test_binop_typecasting[numexpr-python-left_right1-float64-/]'
			'tests/computation/test_eval.py::TestTypeCasting::test_binop_typecasting[numexpr-pandas-left_right0-float64-/]'
			'tests/computation/test_eval.py::TestTypeCasting::test_binop_typecasting[numexpr-pandas-left_right1-float64-/]'
			'tests/computation/test_eval.py::TestOperations::test_simple_arith_ops[numexpr-python]'
			'tests/computation/test_eval.py::TestOperations::test_simple_arith_ops[numexpr-pandas]'
		)
	fi

	local -x LC_ALL=C.UTF-8
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	"${EPYTHON}" -c "import pandas; pandas.show_versions()" || die
	# --no-strict-data-files is necessary since upstream prevents data
	# files from even being included in GitHub archives, sigh
	# https://github.com/pandas-dev/pandas/issues/54907
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest pandas/tests \
		--no-strict-data-files -o xfail_strict=false \
		-m "not single_cpu and not slow and not network and not db" ||
		die "Tests failed with ${EPYTHON}"
	rm test-data.xml test_stata.dta || die
}

pkg_postinst() {
	optfeature "accelerating certain types of NaN evaluations, using specialized cython routines to achieve large speedups." dev-python/bottleneck
	optfeature "accelerating certain numerical operations, using multiple cores as well as smart chunking and caching to achieve large speedups" ">=dev-python/numexpr-2.1"
	optfeature "needed for pandas.io.html.read_html" dev-python/beautifulsoup4 dev-python/html5lib dev-python/lxml
	optfeature "for msgpack compression using blosc" dev-python/blosc
	optfeature "Template engine for conditional HTML formatting" dev-python/jinja2
	optfeature "Plotting support" dev-python/matplotlib
	optfeature "Needed for Excel I/O" ">=dev-python/openpyxl-3.0.10" dev-python/xlsxwriter dev-python/xlrd dev-python/xlwt
	optfeature "necessary for HDF5-based storage" ">=dev-python/tables-3.7.0"
	optfeature "R I/O support" dev-python/rpy2
	optfeature "Needed for parts of pandas.stats" dev-python/statsmodels
	optfeature "SQL database support" ">=dev-python/sqlalchemy-1.4.36"
	optfeature "miscellaneous statistical functions" dev-python/scipy
	optfeature "necessary to use pandas.io.clipboard.read_clipboard support" dev-python/pyqt5 dev-python/qtpy dev-python/pygtk x11-misc/xclip x11-misc/xsel
}
