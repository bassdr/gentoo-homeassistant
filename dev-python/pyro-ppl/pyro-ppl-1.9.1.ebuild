# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="extras funsor horovod lightning profile test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyro-ppl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black>=21.4b0; extra == 'dev'
	black>=21.4b0; extra == 'test'
	funsor[torch]==0.4.4; extra == 'funsor'
	graphviz>=0.8; extra == 'dev'
	graphviz>=0.8; extra == 'extras'
	graphviz>=0.8; extra == 'test'
	horovod[pytorch]>=0.19; extra == 'horovod'
	ipywidgets; extra == 'dev'
	ipywidgets; extra == 'extras'
	ipywidgets; extra == 'test'
	lightning; extra == 'lightning'
	matplotlib>=1.3; extra == 'dev'
	matplotlib>=1.3; extra == 'extras'
	matplotlib>=1.3; extra == 'test'
	mypy>=0.812; extra == 'dev'
	nbformat; extra == 'dev'
	nbsphinx>=0.3.2; extra == 'dev'
	nbstripout; extra == 'dev'
	nbval; extra == 'dev'
	nbval; extra == 'test'
	ninja; extra == 'dev'
	notebook; extra == 'dev'
	notebook; extra == 'extras'
	notebook; extra == 'test'
	numpy>=1.7
	opt-einsum>=2.3.2
	pandas; extra == 'dev'
	pandas; extra == 'extras'
	pandas; extra == 'test'
	pillow>=8.3.1; extra == 'dev'
	pillow>=8.3.1; extra == 'extras'
	pillow>=8.3.1; extra == 'test'
	prettytable; extra == 'profile'
	pypandoc; extra == 'dev'
	pyro-api>=0.1.1
	pytest-benchmark; extra == 'profile'
	pytest-cov; extra == 'test'
	pytest-xdist; extra == 'dev'
	pytest-xdist; extra == 'test'
	pytest>=5.0; extra == 'dev'
	pytest>=5.0; extra == 'test'
	ruff; extra == 'dev'
	ruff; extra == 'test'
	scikit-learn; extra == 'dev'
	scikit-learn; extra == 'extras'
	scikit-learn; extra == 'test'
	scipy>=1.1; extra == 'dev'
	scipy>=1.1; extra == 'extras'
	scipy>=1.1; extra == 'test'
	seaborn>=0.11.0; extra == 'dev'
	seaborn>=0.11.0; extra == 'extras'
	seaborn>=0.11.0; extra == 'test'
	snakeviz; extra == 'profile'
	sphinx-rtd-theme; extra == 'dev'
	sphinx; extra == 'dev'
	torch>=2.0
	torchvision>=0.15.0; extra == 'dev'
	torchvision>=0.15.0; extra == 'extras'
	torchvision>=0.15.0; extra == 'test'
	tqdm>=4.36
	visdom<0.2.2,>=0.1.4; extra == 'dev'
	visdom<0.2.2,>=0.1.4; extra == 'extras'
	visdom<0.2.2,>=0.1.4; extra == 'test'
	wget; extra == 'dev'
	wget; extra == 'extras'
	wget; extra == 'test'
	yapf; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	funsor? ( ~dev-python/funsor-0.4.4[torch,${PYTHON_USEDEP}] )
	extras? ( >=dev-python/graphviz-0.8[${PYTHON_USEDEP}] )
	horovod? ( >=dev-python/horovod-0.19[pytorch,${PYTHON_USEDEP}] )
	extras? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	lightning? ( dev-python/lightning[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/matplotlib-1.3[${PYTHON_USEDEP}] )
	extras? ( dev-python/notebook[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	>=dev-python/opt-einsum-2.3.2[${PYTHON_USEDEP}]
	extras? ( dev-python/pandas[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/pillow-8.3.1[${PYTHON_USEDEP}] )
	profile? ( dev-python/prettytable[${PYTHON_USEDEP}] )
	>=dev-python/pyro-api-0.1.1[${PYTHON_USEDEP}]
	profile? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	extras? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/scipy-1.1[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/seaborn-0.11.0[${PYTHON_USEDEP}] )
	profile? ( dev-python/snakeviz[${PYTHON_USEDEP}] )
	>=dev-python/torch-2.0[${PYTHON_USEDEP}]
	extras? ( >=dev-python/torchvision-0.15.0[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.36[${PYTHON_USEDEP}]
	extras? ( >=dev-python/visdom-0.1.4[${PYTHON_USEDEP}] <dev-python/visdom-0.2.2[${PYTHON_USEDEP}] )
	extras? ( dev-python/wget[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-21.4_beta0[${PYTHON_USEDEP}]
		>=dev-python/graphviz-0.8[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-1.3[${PYTHON_USEDEP}]
		>=dev-python/mypy-0.812[${PYTHON_USEDEP}]
		dev-python/nbformat[${PYTHON_USEDEP}]
		>=dev-python/nbsphinx-0.3.2[${PYTHON_USEDEP}]
		dev-python/nbstripout[${PYTHON_USEDEP}]
		dev-python/nbval[${PYTHON_USEDEP}]
		dev-build/ninja[${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/pillow-8.3.1[${PYTHON_USEDEP}]
		dev-python/pypandoc[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.1[${PYTHON_USEDEP}]
		>=dev-python/seaborn-0.11.0[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		>=dev-python/torchvision-0.15.0[${PYTHON_USEDEP}]
		>=dev-python/visdom-0.1.4[${PYTHON_USEDEP}] <dev-python/visdom-0.2.2[${PYTHON_USEDEP}]
		dev-python/wget[${PYTHON_USEDEP}]
		dev-python/yapf[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
