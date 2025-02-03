# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc fastapi lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/odmantic/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	fastapi? ( >=dev-python/fastapi-0.100.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/mkdocs-macros-plugin-1.0.4[${PYTHON_USEDEP}] =dev-python/mkdocs-macros-plugin-1.0*[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/mkdocs-material-9.5.2[${PYTHON_USEDEP}] =dev-python/mkdocs-material-9.5*[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/mkdocstrings-0.24.0[python,${PYTHON_USEDEP}] =dev-python/mkdocstrings-0.24*[python,${PYTHON_USEDEP}] )
	>=dev-python/motor-3.1.1[${PYTHON_USEDEP}]
	lint? ( >=dev-python/mypy-1.4.1[${PYTHON_USEDEP}] =dev-python/mypy-1.4*[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
	doc? ( >=dev-python/pydocstyle-6.3.0[toml,${PYTHON_USEDEP}] =dev-python/pydocstyle-6.3*[toml,${PYTHON_USEDEP}] )
	>=dev-python/pymongo-4.1.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/ruff-0.3.3[${PYTHON_USEDEP}] =dev-python/ruff-0.3*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/async-asgi-testclient-1.4.11[${PYTHON_USEDEP}] =dev-python/async-asgi-testclient-1.4*[${PYTHON_USEDEP}]
		>=dev-python/asyncmock-0.4.2[${PYTHON_USEDEP}] =dev-python/asyncmock-0.4*[${PYTHON_USEDEP}]
		>=dev-python/coverage-6.2[toml,${PYTHON_USEDEP}] =dev-python/coverage-6*[toml,${PYTHON_USEDEP}]
		>=dev-python/darglint-1.8.1[${PYTHON_USEDEP}] =dev-python/darglint-1.8*[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}] =dev-python/httpx-0.24*[${PYTHON_USEDEP}]
		>=dev-python/inline-snapshot-0.6.0[${PYTHON_USEDEP}] =dev-python/inline-snapshot-0.6*[${PYTHON_USEDEP}]
		>=dev-python/ipython-7.16.1[${PYTHON_USEDEP}] =dev-python/ipython-7.16*[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.16.0[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0.16*[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-4.0.0[${PYTHON_USEDEP}] =dev-python/pytest-benchmark-4.0*[${PYTHON_USEDEP}]
		>=dev-python/pytest-codspeed-2.1.0[${PYTHON_USEDEP}] =dev-python/pytest-codspeed-2.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-sugar-0.9.5[${PYTHON_USEDEP}] =dev-python/pytest-sugar-0.9*[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2.1.0[${PYTHON_USEDEP}] =dev-python/pytest-xdist-2.1*[${PYTHON_USEDEP}]
		>=dev-python/pytz-2023.3[${PYTHON_USEDEP}] =dev-python/pytz-2023*[${PYTHON_USEDEP}]
		>=dev-python/requests-2.24[${PYTHON_USEDEP}] =dev-python/requests-2*[${PYTHON_USEDEP}]
		>=dev-python/semver-2.13.0[${PYTHON_USEDEP}] =dev-python/semver-2.13*[${PYTHON_USEDEP}]
		>=dev-python/typer-0.4.1[${PYTHON_USEDEP}] =dev-python/typer-0.4*[${PYTHON_USEDEP}]
		>=dev-python/types-pytz-2023.3.0.0[${PYTHON_USEDEP}] =dev-python/types-pytz-2023.3.0*[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.17.0[${PYTHON_USEDEP}] =dev-python/uvicorn-0.17*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
