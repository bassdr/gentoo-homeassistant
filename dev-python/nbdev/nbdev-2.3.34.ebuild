# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbdev/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML
	asttokens
	astunparse
	black; extra == 'dev'
	execnb>=0.1.4
	fastcore>=1.5.27
	ghapi>=1.0.3
	ipywidgets; extra == 'dev'
	llms-txt; extra == 'dev'
	matplotlib; extra == 'dev'
	nbclassic; extra == 'dev'
	nbdev-numpy; extra == 'dev'
	nbdev-stdlib; extra == 'dev'
	packaging
	pandas; extra == 'dev'
	pysymbol-llm; extra == 'dev'
	setuptools
	sphinx; extra == 'dev'
	svg.py; extra == 'dev'
	watchdog
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/asttokens[${PYTHON_USEDEP}]
	dev-python/astunparse[${PYTHON_USEDEP}]
	>=dev-python/execnb-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/fastcore-1.5.27[${PYTHON_USEDEP}]
	>=dev-python/ghapi-1.0.3[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/watchdog[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		dev-python/llms-txt[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/nbclassic[${PYTHON_USEDEP}]
		dev-python/nbdev-numpy[${PYTHON_USEDEP}]
		dev-python/nbdev-stdlib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pysymbol-llm[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/svg-py[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
