# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=filesystem_spec-${PV}
DESCRIPTION="File-system specification"
HOMEPAGE="
  https://pypi.org/project/fsspec/
  Changelog, https://filesystem-spec.readthedocs.io/en/latest/changelog.html
  Documentation, https://filesystem-spec.readthedocs.io/en/latest/
  Homepage, https://github.com/fsspec/filesystem_spec
"
# upstream removed tests in 2024.6.0
SRC_URI="
	https://github.com/fsspec/filesystem_spec/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="abfs adl arrow dask doc dropbox full fuse gcs git github gs gui hdfs http libarchive oci s3 sftp smb ssh test-downstream test-full tqdm"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	abfs? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	adl? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	full? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	test-downstream? ( <dev-python/aiobotocore-3.0.0[${PYTHON_USEDEP}] )
	full? ( !=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] )
	http? ( !=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] )
	test-full? ( !=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] )
	test-full? ( dev-python/cloudpickle[${PYTHON_USEDEP}] )
	dask? ( dev-python/dask[${PYTHON_USEDEP}] )
	full? ( dev-python/dask[${PYTHON_USEDEP}] )
	test-downstream? ( dev-python/dask[dataframe,test,${PYTHON_USEDEP}] )
	test-full? ( dev-python/dask[${PYTHON_USEDEP}] )
	test-downstream? ( dev-python/dask-expr[${PYTHON_USEDEP}] )
	dask? ( dev-python/distributed[${PYTHON_USEDEP}] )
	full? ( dev-python/distributed[${PYTHON_USEDEP}] )
	test-full? ( dev-python/distributed[${PYTHON_USEDEP}] )
	dropbox? ( dev-python/dropbox[${PYTHON_USEDEP}] )
	full? ( dev-python/dropbox[${PYTHON_USEDEP}] )
	test-full? ( dev-python/dropbox[${PYTHON_USEDEP}] )
	dropbox? ( dev-python/dropboxdrivefs[${PYTHON_USEDEP}] )
	full? ( dev-python/dropboxdrivefs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/dropboxdrivefs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/fastparquet[${PYTHON_USEDEP}] )
	full? ( dev-python/fusepy[${PYTHON_USEDEP}] )
	fuse? ( dev-python/fusepy[${PYTHON_USEDEP}] )
	test-full? ( dev-python/fusepy[${PYTHON_USEDEP}] )
	full? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	gcs? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	gs? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	test-full? ( dev-python/kerchunk[${PYTHON_USEDEP}] )
	full? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	libarchive? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	test-full? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	test-full? ( dev-python/lz4[${PYTHON_USEDEP}] )
	test-downstream? ( <dev-python/moto-5[server,${PYTHON_USEDEP}] )
	test-full? ( dev-python/notebook[${PYTHON_USEDEP}] )
	test-full? ( dev-python/numpy[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	full? ( dev-python/ocifs[${PYTHON_USEDEP}] )
	oci? ( dev-python/ocifs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/ocifs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full? ( dev-python/panel[${PYTHON_USEDEP}] )
	gui? ( dev-python/panel[${PYTHON_USEDEP}] )
	test-full? ( dev-python/panel[${PYTHON_USEDEP}] )
	full? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	sftp? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	ssh? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	test-full? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	arrow? ( >=dev-python/pyarrow-1[${PYTHON_USEDEP}] )
	full? ( >=dev-python/pyarrow-1[${PYTHON_USEDEP}] )
	hdfs? ( >=dev-python/pyarrow-1[${PYTHON_USEDEP}] )
	test-full? ( >=dev-python/pyarrow-1[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pyftpdlib[${PYTHON_USEDEP}] )
	full? ( dev-python/pygit2[${PYTHON_USEDEP}] )
	git? ( dev-python/pygit2[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pygit2[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-full? ( !=dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest-recording[${PYTHON_USEDEP}] )
	test-full? ( dev-python/pytest-rerunfailures[${PYTHON_USEDEP}] )
	test-downstream? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	test-full? ( dev-python/python-snappy[${PYTHON_USEDEP}] )
	dropbox? ( dev-python/requests[${PYTHON_USEDEP}] )
	full? ( dev-python/requests[${PYTHON_USEDEP}] )
	github? ( dev-python/requests[${PYTHON_USEDEP}] )
	test-full? ( dev-python/requests[${PYTHON_USEDEP}] )
	full? ( dev-python/s3fs[${PYTHON_USEDEP}] )
	s3? ( dev-python/s3fs[${PYTHON_USEDEP}] )
	full? ( dev-python/smbprotocol[${PYTHON_USEDEP}] )
	smb? ( dev-python/smbprotocol[${PYTHON_USEDEP}] )
	test-full? ( dev-python/smbprotocol[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	full? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	test-full? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	tqdm? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	test-full? ( dev-python/urllib3[${PYTHON_USEDEP}] )
	test-downstream? ( dev-python/xarray[${PYTHON_USEDEP}] )
	doc? ( dev-python/yarl[${PYTHON_USEDEP}] )
	test-full? ( dev-python/zarr[${PYTHON_USEDEP}] )
	test-full? ( dev-python/zstandard[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

# Note: this package is not xdist-friendly
distutils_enable_tests pytest
BDEPEND+=" test? (
	!=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	!=dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}]
	dev-python/pytest-benchmark[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-recording[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

src_test() {
	git config --global user.email "you@example.com" || die
	git config --global user.name "Your Name" || die
	distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		fsspec/implementations/tests/test_reference.py::test_async_cat_file_ranges
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p pytest_mock -o tmp_path_retention_policy=all
}
# RDEPEND could not be inserted in this ebuild
