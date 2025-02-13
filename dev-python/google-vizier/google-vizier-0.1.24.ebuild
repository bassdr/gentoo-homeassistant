# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="algorithms all benchmarks jax tf"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-vizier/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}]
	all? ( dev-python/ale-py[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/ale-py[${PYTHON_USEDEP}] )
	>=dev-python/attrs-23.1.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/chex-0.1.87[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/chex-0.1.87[${PYTHON_USEDEP}] )
	all? ( <=dev-python/coverage-6.4.2[${PYTHON_USEDEP}] )
	algorithms? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	all? ( dev-python/cvxopt[${PYTHON_USEDEP}] )
	algorithms? ( dev-python/cvxpy[${PYTHON_USEDEP}] )
	all? ( dev-python/cvxpy[${PYTHON_USEDEP}] )
	all? ( ~dev-python/diversipy-0.9[${PYTHON_USEDEP}] )
	benchmarks? ( ~dev-python/diversipy-0.9[${PYTHON_USEDEP}] )
	all? ( ~dev-python/equinox-0.11.7[${PYTHON_USEDEP}] )
	jax? ( ~dev-python/equinox-0.11.7[${PYTHON_USEDEP}] )
	algorithms? ( dev-python/evojax[${PYTHON_USEDEP}] )
	all? ( dev-python/evojax[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flax-0.10.0[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/flax-0.10.0[${PYTHON_USEDEP}] )
	>=dev-python/googleapis-common-protos-1.56.4[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.49.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/jax-0.4.34[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jax-0.4.34[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jaxlib-0.4.34[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jaxlib-0.4.34[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jaxopt-0.8.3[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jaxopt-0.8.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jaxtyping-0.2.34[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/jaxtyping-0.2.34[${PYTHON_USEDEP}] )
	algorithms? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	all? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	all? ( <=dev-python/mock-4.0.3[${PYTHON_USEDEP}] )
	all? ( dev-python/nats-bench[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/nats-bench[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.21.5[${PYTHON_USEDEP}]
	all? ( >=dev-python/optax-0.2.3[${PYTHON_USEDEP}] )
	jax? ( >=dev-python/optax-0.2.3[${PYTHON_USEDEP}] )
	all? ( ~dev-python/optproblems-1.3[${PYTHON_USEDEP}] )
	benchmarks? ( ~dev-python/optproblems-1.3[${PYTHON_USEDEP}] )
	all? ( dev-python/pandas[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/portpicker-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.6[${PYTHON_USEDEP}]
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/ray[default,${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/ray[default,${PYTHON_USEDEP}] )
	algorithms? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	all? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]
	all? ( >=dev-python/tensorflow-2.9.1[${PYTHON_USEDEP}] )
	tf? ( >=dev-python/tensorflow-2.9.1[${PYTHON_USEDEP}] )
	all? ( dev-python/tfp-nightly[jax,${PYTHON_USEDEP}] )
	jax? ( dev-python/tfp-nightly[jax,${PYTHON_USEDEP}] )
	all? ( <=dev-python/typeguard-2.13.3[${PYTHON_USEDEP}] )
	jax? ( <=dev-python/typeguard-2.13.3[${PYTHON_USEDEP}] )
	all? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/xgboost[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<=dev-python/coverage-6.4.2[${PYTHON_USEDEP}]
	<=dev-python/mock-4.0.3[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"
