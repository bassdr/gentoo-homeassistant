# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all backend-jax backend-tf backend-torch cvxopt dr gnn plot"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pot/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autograd; extra == 'all'
	autograd; extra == 'dr'
	cvxopt; extra == 'all'
	cvxopt; extra == 'cvxopt'
	jax; extra == 'all'
	jax; extra == 'backend-jax'
	jaxlib; extra == 'all'
	jaxlib; extra == 'backend-jax'
	matplotlib; extra == 'all'
	matplotlib; extra == 'plot'
	numpy>=1.16
	pymanopt; extra == 'all'
	pymanopt; extra == 'dr'
	scikit-learn; extra == 'all'
	scikit-learn; extra == 'dr'
	scipy>=1.6
	tensorflow; extra == 'all'
	tensorflow; extra == 'backend-tf'
	torch-geometric; extra == 'all'
	torch-geometric; extra == 'gnn'
	torch; extra == 'all'
	torch; extra == 'backend-torch'
	torch; extra == 'gnn'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/autograd[${PYTHON_USEDEP}] )
	dr? ( dev-python/autograd[${PYTHON_USEDEP}] )
	all? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	cvxopt? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	all? ( dev-python/jax[${PYTHON_USEDEP}] )
	backend-jax? ( dev-python/jax[${PYTHON_USEDEP}] )
	all? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	backend-jax? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	plot? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	all? ( dev-python/pymanopt[${PYTHON_USEDEP}] )
	dr? ( dev-python/pymanopt[${PYTHON_USEDEP}] )
	all? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	dr? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.6[${PYTHON_USEDEP}]
	all? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	backend-tf? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	all? ( dev-python/torch[${PYTHON_USEDEP}] )
	backend-torch? ( dev-python/torch[${PYTHON_USEDEP}] )
	gnn? ( dev-python/torch[${PYTHON_USEDEP}] )
	all? ( dev-python/torch-geometric[${PYTHON_USEDEP}] )
	gnn? ( dev-python/torch-geometric[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
