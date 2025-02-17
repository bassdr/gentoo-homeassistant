# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="fido integration-tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/bravado/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bottle; extra == 'integration-tests'
	bravado-core (>=5.16.1)
	ephemeral-port-reserve; extra == 'integration-tests'
	fido (>=4.2.1); extra == 'fido'
	monotonic
	msgpack
	pytest; extra == 'integration-tests'
	python-dateutil
	pyyaml
	requests (>=2.17)
	simplejson
	six
	typing-extensions
	typing; python_version<'3.5'
"
GENERATED_RDEPEND="${RDEPEND}
	integration-tests? ( dev-python/bottle[${PYTHON_USEDEP}] )
	>=dev-python/bravado-core-5.16.1[${PYTHON_USEDEP}]
	integration-tests? ( dev-python/ephemeral-port-reserve[${PYTHON_USEDEP}] )
	fido? ( >=dev-python/fido-4.2.1[${PYTHON_USEDEP}] )
	dev-python/monotonic[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	integration-tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/requests-2.17[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
