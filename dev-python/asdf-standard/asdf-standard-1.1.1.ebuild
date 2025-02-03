# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asdf-standard/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	docs? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-asdf-0.1.3[${PYTHON_USEDEP}] )
	docs? ( >dev-python/sphinx-rtd-theme-1.2.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/tomli[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/asdf-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-16.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
