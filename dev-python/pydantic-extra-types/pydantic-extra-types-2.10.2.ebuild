# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all pendulum phonenumbers pycountry semver"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydantic-extra-types/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( <dev-python/pendulum-4.0.0[${PYTHON_USEDEP}] )
	pendulum? ( <dev-python/pendulum-4.0.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/phonenumbers-9[${PYTHON_USEDEP}] )
	phonenumbers? ( <dev-python/phonenumbers-9[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pycountry-23[${PYTHON_USEDEP}] )
	pycountry? ( >=dev-python/pycountry-23[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
	<dev-python/python-ulid-2[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytz-2024.1[${PYTHON_USEDEP}] )
	all? ( ~dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	semver? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	all? ( >=dev-python/tzdata-2024.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
