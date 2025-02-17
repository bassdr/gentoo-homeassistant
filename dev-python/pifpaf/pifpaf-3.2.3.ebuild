# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="gnocchi"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pifpaf/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click
	daiquiri
	fixtures
	jinja2
	mock; extra == 'test'
	packaging
	psutil
	requests; extra == 'test'
	stestr; extra == 'test'
	testtools; extra == 'test'
	uwsgi; extra == 'gnocchi'
	xattr; sys_platform != 'win32'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/daiquiri[${PYTHON_USEDEP}]
	dev-python/fixtures[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	gnocchi? ( dev-python/uwsgi[${PYTHON_USEDEP}] )
	dev-python/xattr[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/stestr[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
