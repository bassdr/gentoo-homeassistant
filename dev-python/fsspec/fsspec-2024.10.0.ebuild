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
GENERATED_BDEPEND="${BDEPEND}
	test? (
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
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
