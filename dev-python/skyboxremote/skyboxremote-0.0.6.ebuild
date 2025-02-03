# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="A python library for controlling a sky box"
HOMEPAGE="
  https://pypi.org/project/skyboxremote/
  Documentation, https://github.com/dunnmj/skyboxremote#readme
  Source, https://github.com/dunnmj/skyboxremote
  Tracker, https://github.com/dunnmj/skyboxremote/issues
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="spark"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	spark? ( >=dev-python/pyspark-3.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/bandit-1.7.5[toml,${PYTHON_USEDEP}]
		=dev-python/black-23.3.0[${PYTHON_USEDEP}]
		=dev-python/check-manifest-0.49[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		=dev-python/flake8-bugbear-23.5.9[${PYTHON_USEDEP}]
		dev-python/flake8-docstrings[${PYTHON_USEDEP}]
		dev-python/flake8-formatter-junit-xml[${PYTHON_USEDEP}]
		dev-python/flake8-pyproject[${PYTHON_USEDEP}]
		=dev-python/pylint-2.17.4[${PYTHON_USEDEP}]
		dev-python/pylint-junit[${PYTHON_USEDEP}]
		=dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
		=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}]
		<dev-python/pytest-mock-3.10.1[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		=dev-python/shellcheck-py-0.9.0.2[${PYTHON_USEDEP}]
		=dev-vcs/pre-commit-3.3.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
