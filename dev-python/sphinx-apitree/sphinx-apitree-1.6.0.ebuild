# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="ext test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-apitree/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	etils[ecolab]; extra == 'dev'
	etils[edc,enp,epath,epy,etree]
	myst_nb; extra == 'ext'
	pyink; extra == 'dev'
	pylint>=2.6.0; extra == 'dev'
	pytest-xdist; extra == 'dev'
	pytest>=3.4; extra == 'dev'
	sphinx-apitree[ext]; extra == 'dev'
	sphinx; extra == 'ext'
	sphinx_book_theme; extra == 'ext'
	typing_extensions
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/etils[edc,enp,epath,epy,etree,${PYTHON_USEDEP}]
	ext? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	ext? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	ext? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/etils[ecolab,${PYTHON_USEDEP}]
		dev-python/pyink[${PYTHON_USEDEP}]
		>=dev-python/pylint-2.6.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.4[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/sphinx-apitree[ext,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
