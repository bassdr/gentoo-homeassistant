# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark docs lint plot type"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mmh3/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	lint? ( =dev-python/black-24.10.0[${PYTHON_USEDEP}] )
	lint? ( =dev-python/clang-format-19.1.7[${PYTHON_USEDEP}] )
	lint? ( =dev-python/isort-5.13.2[${PYTHON_USEDEP}] )
	plot? ( =dev-python/matplotlib-3.10.0[${PYTHON_USEDEP}] )
	type? ( =dev-python/mypy-1.14.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/myst-parser-4.0.0[${PYTHON_USEDEP}] )
	plot? ( =dev-python/pandas-2.2.3[${PYTHON_USEDEP}] )
	lint? ( =dev-python/pylint-3.3.3[${PYTHON_USEDEP}] )
	benchmark? ( =dev-python/pymmh3-0.0.5[${PYTHON_USEDEP}] )
	benchmark? ( =dev-python/pyperf-2.8.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/shibuya-2024.12.21[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-8.1.3[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	benchmark? ( =dev-python/xxhash-3.5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		=dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
