# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sagemaker-schema-inference-artifacts/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/json5-0.9.22[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
	test? (
		=dev-python/awslogs-0.14.0[${PYTHON_USEDEP}]
		=dev-python/black-24.3.0[${PYTHON_USEDEP}]
		=dev-python/contextlib2-21.6.0[${PYTHON_USEDEP}]
		<dev-python/coverage-6.2[${PYTHON_USEDEP}]
		=dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		=dev-python/mock-4.0.3[${PYTHON_USEDEP}]
		=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		=dev-python/pytest-rerunfailures-10.2[${PYTHON_USEDEP}]
		=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		=dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}]
		=dev-python/tox-3.24.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
