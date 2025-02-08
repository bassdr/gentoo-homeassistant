# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cached-path/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx<8.0,>=6.0; extra == "dev"
	beaker-py<2.0,>=1.13.2; extra == "dev"
	black<25.0,>=23.1.0; extra == "dev"
	boto3<2.0,>=1.0
	build; extra == "dev"
	filelock<4.0,>=3.4
	flaky; extra == "dev"
	furo==2024.1.29; extra == "dev"
	google-cloud-storage<3.0,>=1.32.0
	huggingface-hub<0.28.0,>=0.8.1
	isort<6.0,>=5.12.0; extra == "dev"
	mypy<2.0,>=1.6.0; extra == "dev"
	myst-parser<3.0,>=1.0.0; extra == "dev"
	packaging; extra == "dev"
	pytest; extra == "dev"
	requests
	responses==0.21.0; extra == "dev"
	rich<14.0,>=12.1
	ruff; extra == "dev"
	setuptools; extra == "dev"
	sphinx-autobuild==2021.3.14; extra == "dev"
	sphinx-autodoc-typehints; extra == "dev"
	sphinx-copybutton==0.5.2; extra == "dev"
	twine>=1.11.0; extra == "dev"
	types-requests; extra == "dev"
	wheel; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/boto3-1.0[${PYTHON_USEDEP}] <dev-python/boto3-2.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.4[${PYTHON_USEDEP}] <dev-python/filelock-4.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-1.32.0[${PYTHON_USEDEP}] <dev-python/google-cloud-storage-3.0[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.8.1[${PYTHON_USEDEP}] <dev-python/huggingface-hub-0.28.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/rich-12.1[${PYTHON_USEDEP}] <dev-python/rich-14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/beaker-py-1.13.2[${PYTHON_USEDEP}] <dev-python/beaker-py-2.0[${PYTHON_USEDEP}]
		>=dev-python/black-23.1.0[${PYTHON_USEDEP}] <dev-python/black-25.0[${PYTHON_USEDEP}]
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		~dev-python/furo-2024.1.29[${PYTHON_USEDEP}]
		>=dev-python/isort-5.12.0[${PYTHON_USEDEP}] <dev-python/isort-6.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.6.0[${PYTHON_USEDEP}] <dev-python/mypy-2.0[${PYTHON_USEDEP}]
		>=dev-python/myst-parser-1.0.0[${PYTHON_USEDEP}] <dev-python/myst-parser-3.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		~dev-python/responses-0.21.0[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/sphinx-6.0[${PYTHON_USEDEP}] <dev-python/sphinx-8.0[${PYTHON_USEDEP}]
		~dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}]
		dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}]
		~dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}]
		>=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
