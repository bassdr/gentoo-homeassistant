# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-optuna/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cffi; extra == "dev"
	deepdiff==6.2.3; extra == "dev"
	importlib-metadata; python_version < "3.8"
	neptune>=1.0.0; extra == "dev"
	numpy<2.0; extra == "dev"
	optuna>=2.4.0
	plotly
	pre-commit; extra == "dev"
	pytest-cov==2.10.1; extra == "dev"
	pytest>=5.0; extra == "dev"
	scikit-learn
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/optuna-2.4.0[${PYTHON_USEDEP}]
	dev-python/plotly[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cffi[${PYTHON_USEDEP}]
		~dev-python/deepdiff-6.2.3[${PYTHON_USEDEP}]
		>=dev-python/neptune-1.0.0[${PYTHON_USEDEP}]
		<dev-python/numpy-2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
