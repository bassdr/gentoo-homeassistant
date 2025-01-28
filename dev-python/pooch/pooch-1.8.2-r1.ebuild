# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pooch/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="progress sftp xxhash"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	sftp? ( >=dev-python/paramiko-2.7.0[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.19.0[${PYTHON_USEDEP}]
	progress? ( <dev-python/tqdm-5.0.0[${PYTHON_USEDEP}] )
	xxhash? ( >=dev-python/xxhash-1.4.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.19.0[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/paramiko-2.7.0[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.41.0[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# Needs network
	pooch/tests/test_core.py::test_check_availability_invalid_downloader
	pooch/tests/test_core.py::test_load_registry_from_doi
	pooch/tests/test_core.py::test_load_registry_from_doi_zenodo_with_slash
	# dev-python/pytest-localftpserver -> dev-python/pyftpdlib has py3.12 issues
	# https://github.com/giampaolo/pyftpdlib/issues/560#issuecomment-971377238
	pooch/tests/test_core.py::test_check_availability_on_ftp
	pooch/tests/test_downloaders.py::test_invalid_doi_repository
	pooch/tests/test_downloaders.py::test_doi_url_not_found
	pooch/tests/test_downloaders.py::test_figshare_url_file_not_found
	pooch/tests/test_downloaders.py::test_doi_downloader
)

### docs no included in pypi tarball
# distutils_enable_sphinx doc \
#	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_httpserver -k "not network"
}
