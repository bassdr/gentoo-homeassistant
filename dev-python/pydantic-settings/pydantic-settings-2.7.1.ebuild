# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="azure-key-vault toml yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydantic-settings/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-identity>=1.16.0; extra == 'azure-key-vault'
	azure-keyvault-secrets>=4.8.0; extra == 'azure-key-vault'
	pydantic>=2.7.0
	python-dotenv>=0.21.0
	pyyaml>=6.0.1; extra == 'yaml'
	tomli>=2.0.1; extra == 'toml'
"
GENERATED_RDEPEND="${RDEPEND}
	azure-key-vault? ( >=dev-python/azure-identity-1.16.0[${PYTHON_USEDEP}] )
	azure-key-vault? ( >=dev-python/azure-keyvault-secrets-4.8.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	yaml? ( >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-2.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
