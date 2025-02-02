# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="build lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dbt-common/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/agate-1.10[${PYTHON_USEDEP}]
	lint? ( <dev-python/black-24.0[${PYTHON_USEDEP}] )
	build? ( dev-python/check-wheel-contents[${PYTHON_USEDEP}] )
	<dev-python/colorama-0.5[${PYTHON_USEDEP}]
	<dev-python/deepdiff-8.0[${PYTHON_USEDEP}]
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-pyproject[${PYTHON_USEDEP}] )
	<dev-python/isodate-0.7[${PYTHON_USEDEP}]
	<dev-python/jinja2-4[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5.0[${PYTHON_USEDEP}]
	<dev-python/mashumaro-4.0[msgpack,${PYTHON_USEDEP}]
	lint? ( <dev-python/mypy-2.0[${PYTHON_USEDEP}] )
	<dev-python/pathspec-0.13[${PYTHON_USEDEP}]
	<dev-python/protobuf-6.0[${PYTHON_USEDEP}]
	lint? ( <dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	<dev-python/python-dateutil-3.0[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	build? ( dev-python/twine[${PYTHON_USEDEP}] )
	lint? ( <dev-python/types-jinja2-3.0[${PYTHON_USEDEP}] )
	lint? ( <dev-python/types-jsonschema-5.0[${PYTHON_USEDEP}] )
	lint? ( <dev-python/types-protobuf-6.0[${PYTHON_USEDEP}] )
	lint? ( <dev-python/types-python-dateutil-3.0[${PYTHON_USEDEP}] )
	lint? ( <dev-python/types-pyyaml-7.0[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/hypothesis-7.0[${PYTHON_USEDEP}]
	<dev-python/pytest-8.0[${PYTHON_USEDEP}]
	<dev-python/pytest-cov-5.0[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	<dev-python/pytest-xdist-4.0[${PYTHON_USEDEP}]
)"
