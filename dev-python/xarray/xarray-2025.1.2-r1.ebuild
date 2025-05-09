# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xarray/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="accel complete etc io parallel test viz"
IUSE="${GENERATED_IUSE} big-endian"

REQUIRES_DIST="
	bottleneck; extra == 'accel'
	cartopy; extra == 'viz'
	cftime; extra == 'io'
	dask[complete]; extra == 'parallel'
	flox; extra == 'accel'
	fsspec; extra == 'io'
	h5netcdf; extra == 'io'
	hypothesis; extra == 'dev'
	jinja2; extra == 'dev'
	matplotlib; extra == 'viz'
	mypy; extra == 'dev'
	nc-time-axis; extra == 'viz'
	netCDF4; extra == 'io'
	numba>=0.54; extra == 'accel'
	numbagg; extra == 'accel'
	numpy>=1.24
	opt_einsum; extra == 'accel'
	packaging>=23.2
	pandas>=2.1
	pooch; extra == 'io'
	pre-commit; extra == 'dev'
	pydap; python_version < '3.10' and extra == 'io'
	pytest-cov; extra == 'dev'
	pytest-env; extra == 'dev'
	pytest-timeout; extra == 'dev'
	pytest-xdist; extra == 'dev'
	pytest; extra == 'dev'
	ruff>=0.8.0; extra == 'dev'
	scipy; extra == 'accel'
	scipy; extra == 'io'
	seaborn; extra == 'viz'
	sparse; extra == 'etc'
	sphinx; extra == 'dev'
	sphinx_autosummary_accessors; extra == 'dev'
	xarray[accel,etc,io,parallel,viz]; extra == 'complete'
	xarray[complete]; extra == 'dev'
	zarr; extra == 'io'
"
GENERATED_RDEPEND="${RDEPEND}
	accel? ( dev-python/bottleneck[${PYTHON_USEDEP}] )
	viz? ( dev-python/cartopy[${PYTHON_USEDEP}] )
	io? ( dev-python/cftime[${PYTHON_USEDEP}] )
	parallel? ( dev-python/dask[complete,${PYTHON_USEDEP}] )
	accel? ( dev-python/flox[${PYTHON_USEDEP}] )
	io? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	io? ( dev-python/h5netcdf[${PYTHON_USEDEP}] )
	viz? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	viz? ( dev-python/nc-time-axis[${PYTHON_USEDEP}] )
	io? ( dev-python/netcdf4[${PYTHON_USEDEP}] )
	accel? ( >=dev-python/numba-0.54[${PYTHON_USEDEP}] )
	accel? ( dev-python/numbagg[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	accel? ( dev-python/opt-einsum[${PYTHON_USEDEP}] )
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1[${PYTHON_USEDEP}]
	io? ( dev-python/pooch[${PYTHON_USEDEP}] )
	accel? ( dev-python/scipy[${PYTHON_USEDEP}] )
	io? ( dev-python/scipy[${PYTHON_USEDEP}] )
	viz? ( dev-python/seaborn[${PYTHON_USEDEP}] )
	etc? ( dev-python/sparse[${PYTHON_USEDEP}] )
	complete? ( dev-python/xarray[accel,etc,io,parallel,viz,${PYTHON_USEDEP}] )
	io? ( dev-python/zarr[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
"
# note: most of the test dependencies are optional
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-env[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.8.0[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-autosummary-accessors[${PYTHON_USEDEP}]
		dev-python/xarray[complete,${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/bottleneck[${PYTHON_USEDEP}]
		dev-python/cftime[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		!riscv? ( !x86? (
			dev-python/netcdf4[bzip2,szip,${PYTHON_USEDEP}]
		) )
		dev-python/toolz[${PYTHON_USEDEP}]
		!hppa? ( >=dev-python/scipy-1.4[${PYTHON_USEDEP}] )
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# TODO: these fail with filter errors even if netcdf4 is built
		# with blosc/zstd support
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[zstd]'
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[blosc_lz]'
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[blosc_lz4]'
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[blosc_lz4hc]'
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[blosc_zlib]'
		'xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding[blosc_zstd]'
	)

	if ! has_version ">=dev-python/scipy-1.4[${PYTHON_USEDEP}]" ; then
		EPYTEST_DESELECT+=(
			'xarray/tests/test_missing.py::test_interpolate_na_2d[coords1]'
		)

		if ! has_version "dev-python/scipy[${PYTHON_USEDEP}]" ; then
			EPYTEST_DESELECT+=(
				xarray/tests/test_calendar_ops.py::test_interp_calendar
			)
		fi
	fi

	if use big-endian ; then
		EPYTEST_DESELECT+=(
			# Appears to be a numpy issue in display? See bug #916460.
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1677-09-21T00:12:43.145224193-ns-int64-20-True]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1970-09-21T00:12:44.145224808-ns-float64-1e+30-True]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1677-09-21T00:12:43.145225216-ns-float64--9.223372036854776e+18-True]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1677-09-21T00:12:43.145224193-ns-int64-None-False]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1677-09-21T00:12:43.145225-us-int64-None-False]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1970-01-01T00:00:01.000001-us-int64-None-False]'
			'xarray/tests/test_coding_times.py::test_roundtrip_datetime64_nanosecond_precision[1677-09-21T00:21:52.901038080-ns-float32-20.0-True]'
		)
	fi

	if [[ ${ABI} != *64* ]]; then
		EPYTEST_DESELECT+=(
			# these tests hardcode object sizes for 64-bit arches
			# https://github.com/pydata/xarray/issues/9127
			xarray/tests/test_dataarray.py::TestDataArray::test_repr_multiindex
			xarray/tests/test_dataarray.py::TestDataArray::test_repr_multiindex_long
			xarray/tests/test_dataset.py::TestDataset::test_repr_multiindex
			xarray/tests/test_formatting.py::test_array_repr_dtypes_unix

			# converting timestamps into ns, causing an overflow
			xarray/tests/test_cftimeindex.py::test_asi8
			xarray/tests/test_coding_times.py::test_decode_cf_time_bounds
			xarray/tests/test_coding_times.py::test_use_cftime_false_standard_calendar_in_range
			xarray/tests/test_coding_times.py::test_decode_cf_datetime_non_standard_units
		)
	fi

	case ${ARCH} in
		arm64)
			EPYTEST_DESELECT+=(
				'xarray/tests/test_backends.py::TestNetCDF4Data::test_roundtrip_mask_and_scale[dtype0-create_unsigned_false_masked_scaled_data-create_encoded_unsigned_false_masked_scaled_data]'
				'xarray/tests/test_backends.py::TestNetCDF4Data::test_roundtrip_mask_and_scale[dtype1-create_unsigned_false_masked_scaled_data-create_encoded_unsigned_false_masked_scaled_data]'
			)
			;;
	esac

	if ! has_version "dev-python/seaborn[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			xarray/tests/test_plot.py::TestContour::test_colors
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
