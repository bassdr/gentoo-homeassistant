# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dbt-core/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2<4,>=3.1.3
	agate<1.10,>=1.7.0
	click<9.0,>=8.0.2
	daff>=1.3.46
	dbt-adapters<2.0,>=1.10.1
	dbt-common<2.0,>=1.13.0
	dbt-extractor<=0.6,>=0.5.0
	dbt-semantic-interfaces<0.8,>=0.7.4
	mashumaro[msgpack]<3.15,>=3.9
	networkx<4.0,>=2.3
	packaging>20.9
	pathspec<0.13,>=0.9
	protobuf<6.0,>=5.0
	pytz>=2015.7
	pyyaml>=6.0
	requests<3.0.0
	snowplow-tracker<2.0,>=1.0.2
	sqlparse<0.6.0,>=0.5.0
	typing-extensions>=4.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/agate-1.7.0[${PYTHON_USEDEP}] <dev-python/agate-1.10[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.2[${PYTHON_USEDEP}] <dev-python/click-9.0[${PYTHON_USEDEP}]
	>=dev-python/daff-1.3.46[${PYTHON_USEDEP}]
	>=dev-python/dbt-adapters-1.10.1[${PYTHON_USEDEP}] <dev-python/dbt-adapters-2.0[${PYTHON_USEDEP}]
	>=dev-python/dbt-common-1.13.0[${PYTHON_USEDEP}] <dev-python/dbt-common-2.0[${PYTHON_USEDEP}]
	>=dev-python/dbt-extractor-0.5.0[${PYTHON_USEDEP}] <=dev-python/dbt-extractor-0.6[${PYTHON_USEDEP}]
	>=dev-python/dbt-semantic-interfaces-0.7.4[${PYTHON_USEDEP}] <dev-python/dbt-semantic-interfaces-0.8[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.3[${PYTHON_USEDEP}] <dev-python/jinja2-4[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.9[msgpack,${PYTHON_USEDEP}] <dev-python/mashumaro-3.15[msgpack,${PYTHON_USEDEP}]
	>=dev-python/networkx-2.3[${PYTHON_USEDEP}] <dev-python/networkx-4.0[${PYTHON_USEDEP}]
	>dev-python/packaging-20.9[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.9[${PYTHON_USEDEP}] <dev-python/pathspec-0.13[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.0[${PYTHON_USEDEP}] <dev-python/protobuf-6.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2015.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/snowplow-tracker-1.0.2[${PYTHON_USEDEP}] <dev-python/snowplow-tracker-2.0[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.5.0[${PYTHON_USEDEP}] <dev-python/sqlparse-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
