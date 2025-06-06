# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all pendulum phonenumbers pycountry python-ulid semver"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydantic-extra-types/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pendulum<4.0.0,>=3.0.0; extra == 'all'
	pendulum<4.0.0,>=3.0.0; extra == 'pendulum'
	phonenumbers<9,>=8; extra == 'all'
	phonenumbers<9,>=8; extra == 'phonenumbers'
	pycountry>=23; extra == 'all'
	pycountry>=23; extra == 'pycountry'
	pydantic>=2.5.2
	python-ulid<2,>=1; python_version < '3.9' and extra == 'all'
	python-ulid<2,>=1; python_version < '3.9' and extra == 'python-ulid'
	python-ulid<4,>=1; python_version >= '3.9' and extra == 'all'
	python-ulid<4,>=1; python_version >= '3.9' and extra == 'python-ulid'
	pytz>=2024.1; extra == 'all'
	semver>=3.0.2; extra == 'all'
	semver>=3.0.2; extra == 'semver'
	semver~=3.0.2; extra == 'all'
	typing-extensions
	tzdata>=2024.1; extra == 'all'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/pendulum-3.0.0[${PYTHON_USEDEP}] <dev-python/pendulum-4.0.0[${PYTHON_USEDEP}] )
	pendulum? ( >=dev-python/pendulum-3.0.0[${PYTHON_USEDEP}] <dev-python/pendulum-4.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/phonenumbers-8[${PYTHON_USEDEP}] <dev-python/phonenumbers-9[${PYTHON_USEDEP}] )
	phonenumbers? ( >=dev-python/phonenumbers-8[${PYTHON_USEDEP}] <dev-python/phonenumbers-9[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pycountry-23[${PYTHON_USEDEP}] )
	pycountry? ( >=dev-python/pycountry-23[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
	all? ( >=dev-python/python-ulid-1[${PYTHON_USEDEP}] <dev-python/python-ulid-4[${PYTHON_USEDEP}] )
	python-ulid? ( >=dev-python/python-ulid-1[${PYTHON_USEDEP}] <dev-python/python-ulid-4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytz-2024.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] =dev-python/semver-3.0*[${PYTHON_USEDEP}] )
	all? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	semver? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	all? ( >=dev-python/tzdata-2024.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
