# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark docs jax lint numpy test torch"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optree/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black; extra == 'lint'
	cpplint; extra == 'lint'
	dm-tree<0.2.0a0,>=0.1; extra == 'benchmark'
	doc8; extra == 'lint'
	docutils; extra == 'docs'
	flake8-bugbear; extra == 'lint'
	flake8-comprehensions; extra == 'lint'
	flake8-docstrings; extra == 'lint'
	flake8-pyi; extra == 'lint'
	flake8-simplify; extra == 'lint'
	flake8; extra == 'lint'
	jax; extra == 'jax'
	jax[cpu]; extra == 'docs'
	jax[cpu]<0.5.0a0,>=0.4.6; extra == 'benchmark'
	mypy; extra == 'lint'
	numpy; extra == 'docs'
	numpy; extra == 'numpy'
	pandas; extra == 'benchmark'
	pre-commit; extra == 'lint'
	pydocstyle; extra == 'lint'
	pyenchant; extra == 'lint'
	pylint[spelling]; extra == 'lint'
	pytest-cov; extra == 'test'
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
	ruff; extra == 'lint'
	sphinx-autoapi; extra == 'docs'
	sphinx-autobuild; extra == 'docs'
	sphinx-autodoc-typehints; extra == 'docs'
	sphinx-copybutton; extra == 'docs'
	sphinx-rtd-theme; extra == 'docs'
	sphinx; extra == 'docs'
	sphinxcontrib-bibtex; extra == 'docs'
	tabulate; extra == 'benchmark'
	termcolor; extra == 'benchmark'
	torch; extra == 'docs'
	torch; extra == 'torch'
	torch<2.6.0a0,>=2.0; extra == 'benchmark'
	torchvision; extra == 'benchmark'
	typing-extensions>=4.5.0
	xdoctest; extra == 'lint'
"
GENERATED_RDEPEND="${RDEPEND}
	lint? ( dev-python/black[${PYTHON_USEDEP}] )
	lint? ( dev-python/cpplint[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/dm-tree-0.1[${PYTHON_USEDEP}] <dev-python/dm-tree-0.2.0_alpha0[${PYTHON_USEDEP}] )
	lint? ( dev-python/doc8[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-bugbear[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-comprehensions[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-pyi[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-simplify[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/jax-0.4.6[cpu,${PYTHON_USEDEP}] <dev-python/jax-0.5.0_alpha0[cpu,${PYTHON_USEDEP}] )
	docs? ( dev-python/jax[cpu,${PYTHON_USEDEP}] )
	jax? ( dev-python/jax[${PYTHON_USEDEP}] )
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpy[${PYTHON_USEDEP}] )
	numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pandas[${PYTHON_USEDEP}] )
	lint? ( dev-python/pydocstyle[${PYTHON_USEDEP}] )
	lint? ( dev-python/pyenchant[${PYTHON_USEDEP}] )
	lint? ( dev-python/pylint[spelling,${PYTHON_USEDEP}] )
	lint? ( dev-python/ruff[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autoapi[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/termcolor[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/torch-2.0[${PYTHON_USEDEP}] <dev-python/torch-2.6.0_alpha0[${PYTHON_USEDEP}] )
	docs? ( dev-python/torch[${PYTHON_USEDEP}] )
	torch? ( dev-python/torch[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	lint? ( dev-python/xdoctest[${PYTHON_USEDEP}] )
	lint? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
