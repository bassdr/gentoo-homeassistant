# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all autograd backends ci docs jax tensorflow torch"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pymanopt/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autograd>=1.2; extra == "autograd"
	black[jupyter]==22.3.0; extra == "dev"
	build==0.8.0; extra == "ci"
	docutils==0.16; extra == "docs"
	flake8-bugbear==22.12.6; extra == "dev"
	flake8-docstrings==1.6.0; extra == "dev"
	flake8-import-order==0.18.2; extra == "dev"
	flake8-pyproject==1.2.2; extra == "dev"
	flake8==5.0.4; extra == "dev"
	ipykernel==6.4.2; extra == "docs"
	isort==5.11.5; extra == "dev"
	jax>=0.2.0; extra == "jax"
	jaxlib; extra == "jax"
	matplotlib; extra == "dev"
	myst-parser==0.16.1; extra == "docs"
	nbsphinx==0.8.7; extra == "docs"
	numpy>=1.16.0
	pip==22.3.1; extra == "ci"
	pre-commit; extra == "dev"
	pymanopt[autograd,jax,tensorflow,torch]; extra == "backends"
	pymanopt[backends,dev]; extra == "all"
	pytest-cov==4.0.0; extra == "dev"
	pytest==7.2.0; extra == "dev"
	scipy!=1.10.*,!=1.11.*,!=1.12.*,>=1.0
	setuptools==66.1.0; extra == "ci"
	sphinx-rtd-theme==1.0.0; extra == "docs"
	sphinx==4.2.0; extra == "docs"
	sphinxcontrib-katex==0.8.6; extra == "docs"
	tensorflow>=2.0.0; extra == "tensorflow"
	torch>=1.0.0; extra == "torch"
	wheel==0.38.4; extra == "ci"
"
GENERATED_RDEPEND="${RDEPEND}
	autograd? ( >=dev-python/autograd-1.2[${PYTHON_USEDEP}] )
	ci? ( ~dev-python/build-0.8.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/docutils-0.16[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/ipykernel-6.4.2[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jax-0.2.0[${PYTHON_USEDEP}] )
	jax? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/nbsphinx-0.8.7[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.16.0[${PYTHON_USEDEP}]
	ci? ( ~dev-python/pip-22.3.1[${PYTHON_USEDEP}] )
	all? ( dev-python/pymanopt[backends,dev,${PYTHON_USEDEP}] )
	backends? ( dev-python/pymanopt[autograd,jax,tensorflow,torch,${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.0[${PYTHON_USEDEP}] !=dev-python/scipy-1.10*[${PYTHON_USEDEP}] !=dev-python/scipy-1.11*[${PYTHON_USEDEP}] !=dev-python/scipy-1.12*[${PYTHON_USEDEP}]
	ci? ( ~dev-python/setuptools-66.1.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-4.2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-katex-0.8.6[${PYTHON_USEDEP}] )
	tensorflow? ( >=dev-python/tensorflow-2.0.0[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.0.0[${PYTHON_USEDEP}] )
	ci? ( ~dev-python/wheel-0.38.4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-22.3.0[jupyter,${PYTHON_USEDEP}]
		~dev-python/flake8-5.0.4[${PYTHON_USEDEP}]
		~dev-python/flake8-bugbear-22.12.6[${PYTHON_USEDEP}]
		~dev-python/flake8-docstrings-1.6.0[${PYTHON_USEDEP}]
		~dev-python/flake8-import-order-0.18.2[${PYTHON_USEDEP}]
		~dev-python/flake8-pyproject-1.2.2[${PYTHON_USEDEP}]
		~dev-python/isort-5.11.5[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		~dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
