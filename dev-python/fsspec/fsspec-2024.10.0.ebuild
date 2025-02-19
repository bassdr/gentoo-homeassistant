# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="abfs adl arrow dask doc dropbox full fuse gcs git github gs gui hdfs http libarchive oci s3 sftp smb ssh test test-downstream test-full tqdm"
IUSE="${GENERATED_IUSE}"

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

REQUIRES_DIST="
	adlfs; extra == 'abfs'
	adlfs; extra == 'adl'
	adlfs; extra == 'full'
	adlfs; extra == 'test-full'
	aiobotocore<3.0.0,>=2.5.4; extra == 'test-downstream'
	aiohttp!=4.0.0a0,!=4.0.0a1; extra == 'full'
	aiohttp!=4.0.0a0,!=4.0.0a1; extra == 'http'
	aiohttp!=4.0.0a0,!=4.0.0a1; extra == 'test'
	aiohttp!=4.0.0a0,!=4.0.0a1; extra == 'test-full'
	cloudpickle; extra == 'test-full'
	dask-expr; extra == 'test-downstream'
	dask; extra == 'dask'
	dask; extra == 'full'
	dask; extra == 'test-full'
	dask[dataframe,test]; extra == 'test-downstream'
	distributed; extra == 'dask'
	distributed; extra == 'full'
	distributed; extra == 'test-full'
	dropbox; extra == 'dropbox'
	dropbox; extra == 'full'
	dropbox; extra == 'test-full'
	dropboxdrivefs; extra == 'dropbox'
	dropboxdrivefs; extra == 'full'
	dropboxdrivefs; extra == 'test-full'
	fastparquet; extra == 'test-full'
	fusepy; extra == 'full'
	fusepy; extra == 'fuse'
	fusepy; extra == 'test-full'
	gcsfs; extra == 'full'
	gcsfs; extra == 'gcs'
	gcsfs; extra == 'gs'
	gcsfs; extra == 'test-full'
	jinja2; extra == 'test-full'
	kerchunk; extra == 'test-full'
	libarchive-c; extra == 'full'
	libarchive-c; extra == 'libarchive'
	libarchive-c; extra == 'test-full'
	lz4; extra == 'test-full'
	moto[server]<5,>4; extra == 'test-downstream'
	notebook; extra == 'test-full'
	numpy; extra == 'test'
	numpy; extra == 'test-full'
	numpydoc; extra == 'doc'
	ocifs; extra == 'full'
	ocifs; extra == 'oci'
	ocifs; extra == 'test-full'
	pandas; extra == 'test-full'
	panel; extra == 'full'
	panel; extra == 'gui'
	panel; extra == 'test-full'
	paramiko; extra == 'full'
	paramiko; extra == 'sftp'
	paramiko; extra == 'ssh'
	paramiko; extra == 'test-full'
	pre-commit; extra == 'dev'
	pyarrow; extra == 'test-full'
	pyarrow>=1; extra == 'arrow'
	pyarrow>=1; extra == 'full'
	pyarrow>=1; extra == 'hdfs'
	pyarrow>=1; extra == 'test-full'
	pyftpdlib; extra == 'test-full'
	pygit2; extra == 'full'
	pygit2; extra == 'git'
	pygit2; extra == 'test-full'
	pytest-asyncio!=0.22.0; extra == 'test'
	pytest-asyncio!=0.22.0; extra == 'test-full'
	pytest-benchmark; extra == 'test'
	pytest-benchmark; extra == 'test-full'
	pytest-cov; extra == 'test'
	pytest-cov; extra == 'test-full'
	pytest-mock; extra == 'test'
	pytest-mock; extra == 'test-full'
	pytest-recording; extra == 'test'
	pytest-recording; extra == 'test-full'
	pytest-rerunfailures; extra == 'test'
	pytest-rerunfailures; extra == 'test-full'
	pytest-timeout; extra == 'test-downstream'
	pytest; extra == 'test'
	pytest; extra == 'test-full'
	python-snappy; extra == 'test-full'
	requests; extra == 'dropbox'
	requests; extra == 'full'
	requests; extra == 'github'
	requests; extra == 'test'
	requests; extra == 'test-full'
	ruff; extra == 'dev'
	s3fs; extra == 'full'
	s3fs; extra == 's3'
	smbprotocol; extra == 'full'
	smbprotocol; extra == 'smb'
	smbprotocol; extra == 'test-full'
	sphinx-design; extra == 'doc'
	sphinx-rtd-theme; extra == 'doc'
	sphinx; extra == 'doc'
	tqdm; extra == 'full'
	tqdm; extra == 'test-full'
	tqdm; extra == 'tqdm'
	urllib3; extra == 'test-full'
	xarray; extra == 'test-downstream'
	yarl; extra == 'doc'
	zarr; extra == 'test-full'
	zstandard; extra == 'test-full'
"
GENERATED_RDEPEND="${RDEPEND}
	abfs? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	adl? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	full? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	test-full? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	test-downstream? ( >=dev-python/aiobotocore-2.5.4[${PYTHON_USEDEP}] <dev-python/aiobotocore-3.0.0[${PYTHON_USEDEP}] )
	full? ( !~dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] !~dev-python/aiohttp-4.0.0_alpha1[${PYTHON_USEDEP}] )
	http? ( !~dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] !~dev-python/aiohttp-4.0.0_alpha1[${PYTHON_USEDEP}] )
	test-full? ( !~dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] !~dev-python/aiohttp-4.0.0_alpha1[${PYTHON_USEDEP}] )
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
	test-downstream? ( >dev-python/moto-4[server,${PYTHON_USEDEP}] <dev-python/moto-5[server,${PYTHON_USEDEP}] )
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
	test-full? ( !~dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}] )
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
RDEPEND="${GENERATED_RDEPEND}"

# Note: this package is not xdist-friendly
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		!~dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}] !~dev-python/aiohttp-4.0.0_alpha1[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		!~dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-recording[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

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
