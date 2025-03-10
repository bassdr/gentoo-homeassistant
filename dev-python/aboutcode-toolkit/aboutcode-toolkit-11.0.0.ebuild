# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aboutcode-toolkit/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx>=5.0.2; extra == 'docs'
	attrs
	black; extra == 'testing'
	boolean.py>=3.5
	certifi
	click
	doc8>=0.11.2; extra == 'docs'
	isort; extra == 'testing'
	jinja2
	license-expression>=0.94
	openpyxl
	packageurl-python>=0.9.0
	pytest!=7.0.0,>=6; extra == 'testing'
	pytest-xdist>=2; extra == 'testing'
	saneyaml
	sphinx-reredirects>=0.1.2; extra == 'docs'
	sphinx-rtd-theme>=1.0.0; extra == 'docs'
	twine; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	>=dev-python/boolean-py-3.5[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	docs? ( >=dev-python/doc8-0.11.2[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/license-expression-0.94[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	>=dev-python/packageurl-python-0.9.0[${PYTHON_USEDEP}]
	dev-python/saneyaml[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !~dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
