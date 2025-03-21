# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="extras pypi test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/panflute/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pygments; extra == 'pypi'
	click<9,>=6
	configparser; extra == 'dev'
	coverage; extra == 'dev'
	docutils; extra == 'pypi'
	flake8; extra == 'dev'
	pandocfilters; extra == 'dev'
	pytest-cov; extra == 'dev'
	pytest; extra == 'dev'
	pyyaml<7,>=3
	requests; extra == 'dev'
	twine; extra == 'pypi'
	wheel; extra == 'pypi'
	yamlloader<2,>=1; extra == 'extras'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-6[${PYTHON_USEDEP}] <dev-python/click-9[${PYTHON_USEDEP}]
	pypi? ( dev-python/docutils[${PYTHON_USEDEP}] )
	pypi? ( dev-python/pygments[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-3[${PYTHON_USEDEP}] <dev-python/pyyaml-7[${PYTHON_USEDEP}]
	pypi? ( dev-python/twine[${PYTHON_USEDEP}] )
	pypi? ( dev-python/wheel[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/yamlloader-1[${PYTHON_USEDEP}] <dev-python/yamlloader-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/configparser[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pandocfilters[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
