# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="fsspec tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydrive2/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	fsspec? ( >=dev-python/appdirs-1.4.3[${PYTHON_USEDEP}] )
	tests? ( ~dev-python/black-24.10.0[${PYTHON_USEDEP}] )
	<dev-python/cryptography-44[${PYTHON_USEDEP}]
	tests? ( dev-python/flake8[${PYTHON_USEDEP}] )
	tests? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	fsspec? ( >=dev-python/fsspec-2021.07.0[${PYTHON_USEDEP}] )
	fsspec? ( >=dev-python/funcy-1.14[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/funcy-1.14[${PYTHON_USEDEP}] )
	>=dev-python/google-api-python-client-1.12.5[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-4.0.0[${PYTHON_USEDEP}]
	tests? ( dev-python/pyinstaller[${PYTHON_USEDEP}] )
	<=dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	tests? ( >=dev-python/pytest-4.6.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-3.0[${PYTHON_USEDEP}]
	tests? ( dev-python/timeout-decorator[${PYTHON_USEDEP}] )
	fsspec? ( >=dev-python/tqdm-4.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
