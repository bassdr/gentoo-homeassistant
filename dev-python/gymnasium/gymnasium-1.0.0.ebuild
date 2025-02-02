# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all atari box2d classic-control jax mujoco mujoco-py other torch toy-text"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gymnasium/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/ale-py-0.9[${PYTHON_USEDEP}] )
	atari? ( >=dev-python/ale-py-0.9[${PYTHON_USEDEP}] )
	all? ( ~dev-python/box2d-py-2.3.5[${PYTHON_USEDEP}] )
	box2d? ( ~dev-python/box2d-py-2.3.5[${PYTHON_USEDEP}] )
	>=dev-python/cloudpickle-1.2.0[${PYTHON_USEDEP}]
	all? ( <dev-python/cython-3[${PYTHON_USEDEP}] )
	mujoco-py? ( <dev-python/cython-3[${PYTHON_USEDEP}] )
	>=dev-python/farama-notifications-0.0.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/flax-0.5.0[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/flax-0.5.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/imageio-2.14.1[${PYTHON_USEDEP}] )
	mujoco? ( >=dev-python/imageio-2.14.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jax-0.4.0[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jax-0.4.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jaxlib-0.4.0[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jaxlib-0.4.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/matplotlib-3.0[${PYTHON_USEDEP}] )
	other? ( >=dev-python/matplotlib-3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/moviepy-1.0.0[${PYTHON_USEDEP}] )
	other? ( >=dev-python/moviepy-1.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/mujoco-2.1.5[${PYTHON_USEDEP}] )
	mujoco? ( >=dev-python/mujoco-2.1.5[${PYTHON_USEDEP}] )
	all? ( <dev-python/mujoco-py-2.2[${PYTHON_USEDEP}] )
	mujoco-py? ( <dev-python/mujoco-py-2.2[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/opencv-python-3.0[${PYTHON_USEDEP}] )
	other? ( >=dev-python/opencv-python-3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	box2d? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	classic-control? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	toy-text? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	all? ( ~dev-python/swig-4[${PYTHON_USEDEP}] )
	box2d? ( ~dev-python/swig-4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/torch-1.0.0[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/dill-0.3.7[${PYTHON_USEDEP}]
	~dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.3[${PYTHON_USEDEP}]
)"
