# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multiprocessing

MY_P=serverless-application-model-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aws-sam-translator/"
SRC_URI="
	https://github.com/aws/serverless-application-model/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black==24.3.0; extra == 'dev'
	boto3-stubs[appconfig,serverlessrepo]==1.*,>=1.19.5; extra == 'dev'
	boto3<2,>=1.23; extra == 'dev'
	boto3==1.*,>=1.19.5
	coverage<8,>=5.3; extra == 'dev'
	dateparser~=1.1; extra == 'dev'
	jsonschema<5,>=3.2
	mypy~=1.3.0; extra == 'dev'
	parameterized~=0.7; extra == 'dev'
	pydantic!=1.10.15,!=1.10.17,<3,>=1.8
	pytest-cov<5,>=2.10; extra == 'dev'
	pytest-env<1,>=0.6; extra == 'dev'
	pytest-rerunfailures<12,>=9.1; extra == 'dev'
	pytest-xdist<4,>=2.5; extra == 'dev'
	pytest<8,>=6.2; extra == 'dev'
	pyyaml~=6.0; extra == 'dev'
	requests~=2.28; extra == 'dev'
	ruamel.yaml==0.17.21; extra == 'dev'
	ruff~=0.4.5; extra == 'dev'
	tenacity~=8.0; extra == 'dev'
	types-PyYAML~=6.0; extra == 'dev'
	types-jsonschema~=3.2; extra == 'dev'
	typing-extensions>=4.4
"
GENERATED_RDEPEND="${RDEPEND}
	=dev-python/boto3-1*[${PYTHON_USEDEP}] >=dev-python/boto3-1.19.5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.2[${PYTHON_USEDEP}] <dev-python/jsonschema-5[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.8[${PYTHON_USEDEP}] <dev-python/pydantic-3[${PYTHON_USEDEP}] !~dev-python/pydantic-1.10.15[${PYTHON_USEDEP}] !~dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/boto3-2[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.19.5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.2[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.8[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-24.3.0[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.23[${PYTHON_USEDEP}] <dev-python/boto3-2[${PYTHON_USEDEP}]
		=dev-python/boto3-stubs-1*[appconfig,serverlessrepo,${PYTHON_USEDEP}] >=dev-python/boto3-stubs-1.19.5[appconfig,serverlessrepo,${PYTHON_USEDEP}]
		>=dev-python/coverage-5.3[${PYTHON_USEDEP}] <dev-python/coverage-8[${PYTHON_USEDEP}]
		>=dev-python/dateparser-1.1[${PYTHON_USEDEP}] =dev-python/dateparser-1*[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.3.0[${PYTHON_USEDEP}] =dev-python/mypy-1.3*[${PYTHON_USEDEP}]
		>=dev-python/parameterized-0.7[${PYTHON_USEDEP}] =dev-python/parameterized-0*[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.2[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.10[${PYTHON_USEDEP}] <dev-python/pytest-cov-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-env-0.6[${PYTHON_USEDEP}] <dev-python/pytest-env-1[${PYTHON_USEDEP}]
		>=dev-python/pytest-rerunfailures-9.1[${PYTHON_USEDEP}] <dev-python/pytest-rerunfailures-12[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2.5[${PYTHON_USEDEP}] <dev-python/pytest-xdist-4[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}] =dev-python/pyyaml-6*[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28[${PYTHON_USEDEP}] =dev-python/requests-2*[${PYTHON_USEDEP}]
		~dev-python/ruamel-yaml-0.17.21[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.4.5[${PYTHON_USEDEP}] =dev-python/ruff-0.4*[${PYTHON_USEDEP}]
		>=dev-python/tenacity-8.0[${PYTHON_USEDEP}] =dev-python/tenacity-8*[${PYTHON_USEDEP}]
		>=dev-python/types-jsonschema-3.2[${PYTHON_USEDEP}] =dev-python/types-jsonschema-3*[${PYTHON_USEDEP}]
		>=dev-python/types-pyyaml-6.0[${PYTHON_USEDEP}] =dev-python/types-pyyaml-6*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_prepare_all() {
	# so much noise...
	sed -i -e '/log_cli/d' pytest.ini || die

	# deps are installed by ebuild, don't try to reinstall them via pip
	truncate --size=0 requirements/*.txt || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x AWS_DEFAULT_REGION=us-east-1
	epytest -o addopts= -o filterwarnings= \
		-p xdist -n "$(makeopts_jobs)" --dist=worksteal
}
