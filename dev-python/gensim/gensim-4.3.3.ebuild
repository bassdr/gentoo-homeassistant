# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="distributed docs test-win"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gensim/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/annoy[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	docs? ( dev-python/nltk[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/pandas[${PYTHON_USEDEP}] )
	docs? ( dev-python/pot[${PYTHON_USEDEP}] )
	test-win? ( dev-python/pot[${PYTHON_USEDEP}] )
	distributed? ( >=dev-python/pyro4-4.27[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pyro4-4.27[${PYTHON_USEDEP}] )
	docs? ( dev-python/pyro4[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-win? ( dev-python/pytest[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test-win? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	docs? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	<dev-python/scipy-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/smart-open-1.8.1[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-5.1.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-gallery-0.11.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-programoutput-0.17[${PYTHON_USEDEP}] )
	docs? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	docs? ( dev-python/testfixtures[${PYTHON_USEDEP}] )
	test-win? ( dev-python/testfixtures[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/visdom-0.1.8.7[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pot[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/testfixtures[${PYTHON_USEDEP}]
	!=dev-python/visdom-0.1.8.7[${PYTHON_USEDEP}]
)"
