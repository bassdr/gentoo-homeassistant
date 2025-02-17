# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/bandit/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="baseline sarif yaml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	GitPython>=3.1.30; extra == 'baseline'
	PyYAML; extra == 'yaml'
	PyYAML>=5.3.1
	beautifulsoup4>=4.8.0; extra == 'test'
	colorama>=0.3.9; platform_system == 'Windows'
	coverage>=4.5.4; extra == 'test'
	fixtures>=3.0.0; extra == 'test'
	flake8>=4.0.0; extra == 'test'
	jschema-to-python>=1.2.3; extra == 'sarif'
	pylint==1.9.4; extra == 'test'
	rich
	sarif-om>=1.0.4; extra == 'sarif'
	stestr>=2.5.0; extra == 'test'
	stevedore>=1.20.0
	testscenarios>=0.5.0; extra == 'test'
	testtools>=2.3.0; extra == 'test'
	tomli>=1.1.0; python_version < '3.11' and extra == 'toml'
"
GENERATED_RDEPEND="${RDEPEND}
	baseline? ( >=dev-python/gitpython-3.1.30[${PYTHON_USEDEP}] )
	sarif? ( >=dev-python/jschema-to-python-1.2.3[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	yaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	dev-python/rich[${PYTHON_USEDEP}]
	sarif? ( >=dev-python/sarif-om-1.0.4[${PYTHON_USEDEP}] )
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1.30[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/beautifulsoup4-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/jschema-to-python-1.2.3[${PYTHON_USEDEP}]
		>=dev-python/pylint-1.9.4[${PYTHON_USEDEP}]
		>=dev-python/sarif-om-1.0.4[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.3.0[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			>=dev-python/tomli-1.1.0[${PYTHON_USEDEP}]
		' 3.10)
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/beautifulsoup4-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-4.5.4[${PYTHON_USEDEP}]
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-4.0.0[${PYTHON_USEDEP}]
		~dev-python/pylint-1.9.4[${PYTHON_USEDEP}]
		>=dev-python/stestr-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.3.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
