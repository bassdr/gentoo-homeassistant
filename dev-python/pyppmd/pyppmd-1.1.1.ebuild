# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="check docs fuzzer"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyppmd/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	atheris; extra == "fuzzer"
	check-manifest; extra == "check"
	coverage[toml]>=5.2; extra == "test"
	flake8-black; extra == "check"
	flake8-isort; extra == "check"
	flake8; extra == "check"
	hypothesis; extra == "fuzzer"
	hypothesis; extra == "test"
	mypy>=1.10.0; extra == "check"
	pygments; extra == "check"
	pytest-benchmark; extra == "test"
	pytest-cov; extra == "test"
	pytest-timeout; extra == "test"
	pytest>=6.0; extra == "test"
	readme-renderer; extra == "check"
	sphinx; extra == "docs"
	sphinx_rtd_theme; extra == "docs"
"
GENERATED_RDEPEND="${RDEPEND}
	fuzzer? ( dev-python/atheris[${PYTHON_USEDEP}] )
	check? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-black[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-isort[${PYTHON_USEDEP}] )
	fuzzer? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	check? ( >=dev-python/mypy-1.10.0[${PYTHON_USEDEP}] )
	check? ( dev-python/pygments[${PYTHON_USEDEP}] )
	check? ( dev-python/readme-renderer[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-5.2[toml,${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
