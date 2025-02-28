# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="ci cuda cuda12 cuda12-local cuda12-pip k8s minimum-jaxlib rocm tpu"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jax/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	jax-cuda12-plugin==0.5.0; extra == 'cuda12-local'
	jax-cuda12-plugin[with_cuda]<=0.5.0,>=0.5.0; extra == 'cuda'
	jax-cuda12-plugin[with_cuda]<=0.5.0,>=0.5.0; extra == 'cuda12'
	jax-cuda12-plugin[with_cuda]<=0.5.0,>=0.5.0; extra == 'cuda12-pip'
	jax-rocm60-plugin<=0.5.0,>=0.5.0; extra == 'rocm'
	jaxlib<=0.5.0,>=0.5.0
	jaxlib<=0.5.0,>=0.5.0; extra == 'tpu'
	jaxlib==0.4.38; extra == 'ci'
	jaxlib==0.5.0; extra == 'cuda'
	jaxlib==0.5.0; extra == 'cuda12'
	jaxlib==0.5.0; extra == 'cuda12-local'
	jaxlib==0.5.0; extra == 'cuda12-pip'
	jaxlib==0.5.0; extra == 'minimum-jaxlib'
	jaxlib==0.5.0; extra == 'rocm'
	kubernetes; extra == 'k8s'
	libtpu-nightly==0.1.dev20241010+nightly.cleanup; extra == 'tpu'
	libtpu==0.0.8; extra == 'tpu'
	ml_dtypes>=0.4.0
	numpy>=1.25
	numpy>=1.26.0; python_version >= '3.12'
	opt_einsum
	requests; extra == 'tpu'
	scipy>=1.11.1
"
GENERATED_RDEPEND="${RDEPEND}
	cuda12-local? ( ~dev-python/jax-cuda12-plugin-0.5.0[${PYTHON_USEDEP}] )
	cuda12-pip? ( >=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] <=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] )
	cuda12? ( >=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] <=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] )
	cuda? ( >=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] <=dev-python/jax-cuda12-plugin-0.5.0[with_cuda,${PYTHON_USEDEP}] )
	rocm? ( >=dev-python/jax-rocm60-plugin-0.5.0[${PYTHON_USEDEP}] <=dev-python/jax-rocm60-plugin-0.5.0[${PYTHON_USEDEP}] )
	>=dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}]
	ci? ( ~dev-python/jaxlib-0.4.38[${PYTHON_USEDEP}] )
	cuda12-local? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	cuda12-pip? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	cuda12? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	cuda? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	minimum-jaxlib? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	rocm? ( ~dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	tpu? ( >=dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.5.0[${PYTHON_USEDEP}] )
	k8s? ( dev-python/kubernetes[${PYTHON_USEDEP}] )
	tpu? ( ~dev-python/libtpu-0.0.8[${PYTHON_USEDEP}] )
	tpu? ( ~dev-python/libtpu-nightly-0.1_pre20241010[${PYTHON_USEDEP}] )
	>=dev-python/ml-dtypes-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	dev-python/opt-einsum[${PYTHON_USEDEP}]
	tpu? ( dev-python/requests[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.11.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
