# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/universal-pathlib/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/adlfs[${PYTHON_USEDEP}] )
	dev? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev? ( dev-python/cheroot[${PYTHON_USEDEP}] )
	!=dev-python/fsspec-2024.3.1[${PYTHON_USEDEP}]
	dev? ( dev-python/gcsfs[${PYTHON_USEDEP}] )
	dev? ( dev-python/moto[s3,server,${PYTHON_USEDEP}] )
	tests? ( >=dev-python/mypy-1.10.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/packaging[${PYTHON_USEDEP}] )
	dev? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	dev? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	dev? ( dev-python/pydantic-settings[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pylint-2.17.4[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-mock-3.12.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-mypy-plugins-3.1.2[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-sugar-0.9.7[${PYTHON_USEDEP}] )
	dev? ( dev-python/requests[${PYTHON_USEDEP}] )
	dev? ( dev-python/s3fs[${PYTHON_USEDEP}] )
	dev? ( dev-python/smbprotocol[${PYTHON_USEDEP}] )
	dev? ( dev-python/webdav4[fsspec,${PYTHON_USEDEP}] )
	dev? ( dev-python/wsgidav[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest