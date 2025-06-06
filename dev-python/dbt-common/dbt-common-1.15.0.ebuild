# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dbt-common/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	agate<1.10,>=1.7.0
	black<24.0,>=23.3; extra == 'lint'
	check-wheel-contents; extra == 'build'
	colorama<0.5,>=0.3.9
	deepdiff<8.0,>=7.0
	flake8-docstrings; extra == 'lint'
	flake8-pyproject; extra == 'lint'
	flake8; extra == 'lint'
	hypothesis<7.0,>=6.87; extra == 'test'
	isodate<0.7,>=0.6
	jinja2<4,>=3.1.3
	jsonschema<5.0,>=4.0
	mashumaro[msgpack]<4.0,>=3.9
	mypy<2.0,>=1.3; extra == 'lint'
	pathspec<0.13,>=0.9
	protobuf<6.0,>=5.0
	pytest-cov<5.0,>=4.1; extra == 'test'
	pytest-mock; extra == 'test'
	pytest-xdist<4.0,>=3.2; extra == 'test'
	pytest<8.0,>=7.3; extra == 'lint'
	pytest<8.0,>=7.3; extra == 'test'
	python-dateutil<3.0,>=2.0
	requests<3.0.0
	twine; extra == 'build'
	types-jinja2<3.0,>=2.11; extra == 'lint'
	types-jsonschema<5.0,>=4.17; extra == 'lint'
	types-protobuf<6.0,>=5.0; extra == 'lint'
	types-python-dateutil<3.0,>=2.8; extra == 'lint'
	types-pyyaml<7.0,>=6.0; extra == 'lint'
	types-requests; extra == 'lint'
	typing-extensions<5.0,>=4.4
	wheel; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/agate-1.7.0[${PYTHON_USEDEP}] <dev-python/agate-1.10[${PYTHON_USEDEP}]
	lint? ( >=dev-python/black-23.3[${PYTHON_USEDEP}] <dev-python/black-24.0[${PYTHON_USEDEP}] )
	>=dev-python/colorama-0.3.9[${PYTHON_USEDEP}] <dev-python/colorama-0.5[${PYTHON_USEDEP}]
	>=dev-python/deepdiff-7.0[${PYTHON_USEDEP}] <dev-python/deepdiff-8.0[${PYTHON_USEDEP}]
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-docstrings[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-pyproject[${PYTHON_USEDEP}] )
	>=dev-python/isodate-0.6[${PYTHON_USEDEP}] <dev-python/isodate-0.7[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.3[${PYTHON_USEDEP}] <dev-python/jinja2-4[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.0[${PYTHON_USEDEP}] <dev-python/jsonschema-5.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.9[msgpack,${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[msgpack,${PYTHON_USEDEP}]
	lint? ( >=dev-python/mypy-1.3[${PYTHON_USEDEP}] <dev-python/mypy-2.0[${PYTHON_USEDEP}] )
	>=dev-python/pathspec-0.9[${PYTHON_USEDEP}] <dev-python/pathspec-0.13[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.0[${PYTHON_USEDEP}] <dev-python/protobuf-6.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/pytest-7.3[${PYTHON_USEDEP}] <dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.0[${PYTHON_USEDEP}] <dev-python/python-dateutil-3.0[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/types-jinja2-2.11[${PYTHON_USEDEP}] <dev-python/types-jinja2-3.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/types-jsonschema-4.17[${PYTHON_USEDEP}] <dev-python/types-jsonschema-5.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/types-protobuf-5.0[${PYTHON_USEDEP}] <dev-python/types-protobuf-6.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/types-python-dateutil-2.8[${PYTHON_USEDEP}] <dev-python/types-python-dateutil-3.0[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/types-pyyaml-6.0[${PYTHON_USEDEP}] <dev-python/types-pyyaml-7.0[${PYTHON_USEDEP}] )
	lint? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.4[${PYTHON_USEDEP}] <dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	dev-python/check-wheel-contents[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		>=dev-python/hypothesis-6.87[${PYTHON_USEDEP}] <dev-python/hypothesis-7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.3[${PYTHON_USEDEP}] <dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}] <dev-python/pytest-cov-5.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.2[${PYTHON_USEDEP}] <dev-python/pytest-xdist-4.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
