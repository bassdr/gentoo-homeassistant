# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/livemark/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-22.0[${PYTHON_USEDEP}]
	>=dev-python/cached-property-1.5[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-0.3[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.10[${PYTHON_USEDEP}]
	>=dev-python/frictionless-4.0[excel,json,${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1[${PYTHON_USEDEP}]
	>=dev-python/giturlparse-0.10[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.5[${PYTHON_USEDEP}]
	>=dev-python/livereload-2.6[${PYTHON_USEDEP}]
	=dev-python/marko-1*[${PYTHON_USEDEP}]
	=dev-python/pyquery-1*[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		=dev-python/pyflakes-2.4.0[${PYTHON_USEDEP}]
		dev-python/pylama[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-only[${PYTHON_USEDEP}]
		dev-python/pytest-vcr[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
