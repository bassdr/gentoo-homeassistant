# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-optimizer/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	=dev-python/furiosa-common-0.10*[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}] =dev-python/numpy-1*[${PYTHON_USEDEP}]
	>=dev-python/onnx-1.14.0[${PYTHON_USEDEP}] =dev-python/onnx-1.14*[${PYTHON_USEDEP}]
	>=dev-python/onnx-simplifier-0.4.33[${PYTHON_USEDEP}] =dev-python/onnx-simplifier-0.4*[${PYTHON_USEDEP}]
	=dev-python/onnxoptimizer-0.3.13[${PYTHON_USEDEP}]
	>=dev-python/onnxruntime-1.15.1[${PYTHON_USEDEP}] =dev-python/onnxruntime-1.15*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
