# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-task/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	celery-types; python_version > '3.9' and extra == 'dev'
	celery-types==0.15.0; python_version < '3.9' and extra == 'dev'
	celery<6,>=5.3.0
	dvc-task[docs,tests]; extra == 'dev'
	funcy>=1.17
	kombu<6,>=5.3.0
	mkdocs-gen-files<1,>=0.5.0; extra == 'docs'
	mkdocs-material<10,>=9.3.1; extra == 'docs'
	mkdocs-section-index<1,>=0.3.6; extra == 'docs'
	mkdocs<2,>=1.5.2; extra == 'docs'
	mkdocstrings-python<2,>=1.6.3; extra == 'docs'
	mypy==1.11.2; extra == 'dev'
	pytest-celery<1; extra == 'tests'
	pytest-cov>=4.1.0; extra == 'tests'
	pytest-mock; extra == 'tests'
	pytest-rerunfailures; extra == 'tests'
	pytest-sugar; extra == 'tests'
	pytest-test-utils>=0.0.6; extra == 'tests'
	pytest<9,>=7; extra == 'tests'
	pywin32>=225; sys_platform == 'win32'
	shortuuid>=1.0.8
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/celery-5.3.0[${PYTHON_USEDEP}] <dev-python/celery-6[${PYTHON_USEDEP}]
	>=dev-python/funcy-1.17[${PYTHON_USEDEP}]
	>=dev-python/kombu-5.3.0[${PYTHON_USEDEP}] <dev-python/kombu-6[${PYTHON_USEDEP}]
	docs? ( >=dev-python/mkdocs-1.5.2[${PYTHON_USEDEP}] <dev-python/mkdocs-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocs-gen-files-0.5.0[${PYTHON_USEDEP}] <dev-python/mkdocs-gen-files-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocs-material-9.3.1[${PYTHON_USEDEP}] <dev-python/mkdocs-material-10[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocs-section-index-0.3.6[${PYTHON_USEDEP}] <dev-python/mkdocs-section-index-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mkdocstrings-python-1.6.3[${PYTHON_USEDEP}] <dev-python/mkdocstrings-python-2[${PYTHON_USEDEP}] )
	>=dev-python/shortuuid-1.0.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/celery-types[${PYTHON_USEDEP}]
		dev-python/dvc-task[docs,tests,${PYTHON_USEDEP}]
		~dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
		<dev-python/pytest-celery-1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		>=dev-python/pytest-test-utils-0.0.6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
