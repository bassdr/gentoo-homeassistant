# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.8.1.post1)"
S="${WORKDIR}/${PN}-0.8.1.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/donfig/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cloudpickle; extra == 'docs'
	cloudpickle; extra == 'test'
	numpydoc; extra == 'docs'
	pytest; extra == 'docs'
	pytest; extra == 'test'
	pyyaml
	sphinx>=4.0.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/cloudpickle[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
