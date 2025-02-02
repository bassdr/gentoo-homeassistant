# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="check cover doc enabler type"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco.mongodb/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/autocommand[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/backports-tarfile[${PYTHON_USEDEP}]' python3_12)
	dev-python/cachetools[${PYTHON_USEDEP}]
	doc? ( dev-python/cherrypy[${PYTHON_USEDEP}] )
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-collections-2[${PYTHON_USEDEP}]
	>=dev-python/jaraco-context-2[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-2[${PYTHON_USEDEP}]
	>=dev-python/jaraco-itertools-2[${PYTHON_USEDEP}]
	>=dev-python/jaraco-logging-2[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-services-2[${PYTHON_USEDEP}]
	>=dev-python/jaraco-ui-2[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/portend[${PYTHON_USEDEP}]
	>=dev-python/pymongo-3.5[${PYTHON_USEDEP}]
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytimeparse[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tempora[${PYTHON_USEDEP}]
	type? ( dev-python/types-cachetools[${PYTHON_USEDEP}] )
	type? ( dev-python/types-python-dateutil[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/cherrypy[${PYTHON_USEDEP}]
	!=dev-python/pytest-8.1[${PYTHON_USEDEP}]
)"
