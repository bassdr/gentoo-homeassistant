# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pynvml/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	nvidia-ml-py<13.0.0a0,>=12.0.0
	pytest-cov; extra == 'test'
	pytest-runner; extra == 'test'
	pytest>=3.6; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/nvidia-ml-py-12.0.0[${PYTHON_USEDEP}] <dev-python/nvidia-ml-py-13.0.0_alpha0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
