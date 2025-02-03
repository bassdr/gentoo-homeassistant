# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sanic-ext/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyyaml-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-21.4_beta2[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/flake8-3.7.7[${PYTHON_USEDEP}]
		>=dev-python/isort-5.0.0[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/sanic-testing-22.9.0[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
