# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/saneyaml/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML
	Sphinx>=3.3.1; extra == 'docs'
	aboutcode-toolkit>=7.0.2; extra == 'testing'
	black; extra == 'testing'
	doc8>=0.8.1; extra == 'docs'
	isort; extra == 'testing'
	pytest!=7.0.0,>=6; extra == 'testing'
	pytest-xdist>=2; extra == 'testing'
	sphinx-rtd-theme>=0.5.0; extra == 'docs'
	twine; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/doc8-0.8.1[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-3.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-0.5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/aboutcode-toolkit-7.0.2[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !~dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
