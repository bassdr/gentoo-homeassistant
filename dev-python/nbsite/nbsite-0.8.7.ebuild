# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="build gallery refman"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbsite/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4
	flake8; extra == "tests"
	graphviz; extra == "refman"
	ipykernel
	jinja2
	jupyter-client
	myst-nb>=1.1
	myst-parser>=3
	nbconvert
	nbformat
	notebook
	param>=1.6.1; extra == "build"
	param>=1.7.0
	phantomjs; extra == "gallery"
	pillow
	portalocker
	pre-commit; extra == "tests"
	pydata-sphinx-theme<0.16,>=0.15
	pytest>=3.9.1; extra == "tests"
	pyviz-comms
	selenium; extra == "gallery"
	setuptools; extra == "build"
	sphinx-copybutton
	sphinx-design
	sphinx>=7
	sphinxext-rediraffe
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	refman? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/jupyter-client[${PYTHON_USEDEP}]
	>=dev-python/myst-nb-1.1[${PYTHON_USEDEP}]
	>=dev-python/myst-parser-3[${PYTHON_USEDEP}]
	dev-python/nbconvert[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/notebook[${PYTHON_USEDEP}]
	>=dev-python/param-1.7.0[${PYTHON_USEDEP}]
	build? ( >=dev-python/param-1.6.1[${PYTHON_USEDEP}] )
	gallery? ( dev-python/phantomjs[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/portalocker[${PYTHON_USEDEP}]
	>=dev-python/pydata-sphinx-theme-0.15[${PYTHON_USEDEP}] <dev-python/pydata-sphinx-theme-0.16[${PYTHON_USEDEP}]
	dev-python/pyviz-comms[${PYTHON_USEDEP}]
	gallery? ( dev-python/selenium[${PYTHON_USEDEP}] )
	build? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-7[${PYTHON_USEDEP}]
	dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
	dev-python/sphinx-design[${PYTHON_USEDEP}]
	dev-python/sphinxext-rediraffe[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.9.1[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
