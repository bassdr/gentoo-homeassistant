# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="develop"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/brax/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	absl-py
	dataclasses; python_version < "3.7"
	dm_env
	etils
	flask
	flask_cors
	flax
	grpcio
	gym
	jax>=0.4.6
	jaxlib>=0.4.6
	jaxopt
	jinja2
	ml_collections
	mujoco
	mujoco-mjx
	numpy
	optax
	orbax-checkpoint
	pytest; extra == "develop"
	pytinyrenderer
	scipy
	tensorboardX
	transforms3d; extra == "develop"
	trimesh
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/dm-env[${PYTHON_USEDEP}]
	dev-python/etils[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-cors[${PYTHON_USEDEP}]
	dev-python/flax[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
	dev-python/gym[${PYTHON_USEDEP}]
	>=dev-python/jax-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.4.6[${PYTHON_USEDEP}]
	dev-python/jaxopt[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/ml-collections[${PYTHON_USEDEP}]
	dev-python/mujoco[${PYTHON_USEDEP}]
	dev-python/mujoco-mjx[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/optax[${PYTHON_USEDEP}]
	dev-python/orbax-checkpoint[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	develop? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/pytinyrenderer[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/tensorboardx[${PYTHON_USEDEP}]
	develop? ( dev-python/transforms3d[${PYTHON_USEDEP}] )
	dev-python/trimesh[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
