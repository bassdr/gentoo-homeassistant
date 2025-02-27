# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asdf-transform-schemas/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	asdf >=2.8.0 ; extra == 'test'
	asdf-astropy ; extra == 'test'
	asdf-standard >=1.1.0
	astropy >=5.0.4 ; extra == 'docs'
	docutils ; extra == 'docs'
	graphviz ; extra == 'docs'
	matplotlib ; extra == 'docs'
	pytest ; extra == 'test'
	scipy ; extra == 'test'
	sphinx ; extra == 'docs'
	sphinx-asdf >=0.1.3 ; extra == 'docs'
	sphinx-astropy ; extra == 'docs'
	sphinx-rtd-theme ; extra == 'docs'
	tomli ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asdf-standard-1.1.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/astropy-5.0.4[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	docs? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-asdf-0.1.3[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-astropy[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/tomli[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/asdf-2.8.0[${PYTHON_USEDEP}]
		dev-python/asdf-astropy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
