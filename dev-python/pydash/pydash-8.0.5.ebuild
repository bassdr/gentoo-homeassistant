# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydash/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build; extra == 'dev'
	coverage; extra == 'dev'
	furo; extra == 'dev'
	invoke; extra == 'dev'
	mypy; extra == 'dev'
	pytest-cov; extra == 'dev'
	pytest-mypy-testing; extra == 'dev'
	pytest; extra == 'dev'
	ruff; extra == 'dev'
	sphinx-autodoc-typehints; extra == 'dev'
	sphinx; extra == 'dev'
	tox; extra == 'dev'
	twine; extra == 'dev'
	typing-extensions!=4.6.0,>3.10
	wheel; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/typing-extensions-3.10[${PYTHON_USEDEP}] !~dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/furo[${PYTHON_USEDEP}]
		dev-python/invoke[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mypy-testing[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
