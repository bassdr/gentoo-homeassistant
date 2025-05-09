# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all atari box2d classic-control jax mujoco mujoco-py other test torch toy-text"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gymnasium/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	ale-py>=0.9; extra == 'all'
	ale-py>=0.9; extra == 'atari'
	box2d-py==2.3.5; extra == 'all'
	box2d-py==2.3.5; extra == 'box2d'
	cloudpickle>=1.2.0
	cython<3; extra == 'all'
	cython<3; extra == 'mujoco-py'
	dill>=0.3.7; extra == 'testing'
	farama-notifications>=0.0.1
	flax>=0.5.0; extra == 'all'
	flax>=0.5.0; extra == 'jax'
	imageio>=2.14.1; extra == 'all'
	imageio>=2.14.1; extra == 'mujoco'
	importlib-metadata>=4.8.0; python_version < '3.10'
	jax>=0.4.0; extra == 'all'
	jax>=0.4.0; extra == 'jax'
	jaxlib>=0.4.0; extra == 'all'
	jaxlib>=0.4.0; extra == 'jax'
	matplotlib>=3.0; extra == 'all'
	matplotlib>=3.0; extra == 'other'
	moviepy>=1.0.0; extra == 'all'
	moviepy>=1.0.0; extra == 'other'
	mujoco-py<2.2,>=2.1; extra == 'all'
	mujoco-py<2.2,>=2.1; extra == 'mujoco-py'
	mujoco>=2.1.5; extra == 'all'
	mujoco>=2.1.5; extra == 'mujoco'
	numpy>=1.21.0
	opencv-python>=3.0; extra == 'all'
	opencv-python>=3.0; extra == 'other'
	pygame>=2.1.3; extra == 'all'
	pygame>=2.1.3; extra == 'box2d'
	pygame>=2.1.3; extra == 'classic-control'
	pygame>=2.1.3; extra == 'toy-text'
	pytest==7.1.3; extra == 'testing'
	scipy>=1.7.3; extra == 'testing'
	swig==4.*; extra == 'all'
	swig==4.*; extra == 'box2d'
	torch>=1.0.0; extra == 'all'
	torch>=1.0.0; extra == 'torch'
	typing-extensions>=4.3.0
"
GENERATED_RDEPEND="${RDEPEND}
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
	all? ( >=dev-python/mujoco-py-2.1[${PYTHON_USEDEP}] <dev-python/mujoco-py-2.2[${PYTHON_USEDEP}] )
	mujoco-py? ( >=dev-python/mujoco-py-2.1[${PYTHON_USEDEP}] <dev-python/mujoco-py-2.2[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/opencv-python-3.0[${PYTHON_USEDEP}] )
	other? ( >=dev-python/opencv-python-3.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	box2d? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	classic-control? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	toy-text? ( >=dev-python/pygame-2.1.3[${PYTHON_USEDEP}] )
	all? ( =dev-python/swig-4*[${PYTHON_USEDEP}] )
	box2d? ( =dev-python/swig-4*[${PYTHON_USEDEP}] )
	all? ( >=dev-python/torch-1.0.0[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/dill-0.3.7[${PYTHON_USEDEP}]
		~dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.7.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
