# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all azure black docs gcs github hdfs s3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/papermill/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]' python3_12)
	dev-python/ansicolors[${PYTHON_USEDEP}]
	all? ( >=dev-python/azure-datalake-store-0.0.30[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-datalake-store-0.0.30[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/azure-datalake-store-0.0.30[${PYTHON_USEDEP}] )
	all? ( >=dev-python/azure-identity-1.3.1[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-identity-1.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/azure-identity-1.3.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/azure-storage-blob-12.1.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-storage-blob-12.1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/azure-storage-blob-12.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/black-19.3_beta0[${PYTHON_USEDEP}] )
	black? ( >=dev-python/black-19.3_beta0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/black-19.3_beta0[${PYTHON_USEDEP}] )
	all? ( dev-python/boto3[${PYTHON_USEDEP}] )
	docs? ( dev-python/boto3[${PYTHON_USEDEP}] )
	s3? ( dev-python/boto3[${PYTHON_USEDEP}] )
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/entrypoints[${PYTHON_USEDEP}]
	docs? ( dev-python/entrypoints[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/furo-2023.9.10[${PYTHON_USEDEP}] )
	all? ( >=dev-python/gcsfs-0.2.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/gcsfs-0.2.0[${PYTHON_USEDEP}] )
	gcs? ( >=dev-python/gcsfs-0.2.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/moto-4.2.8[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-2.0.0[${PYTHON_USEDEP}] )
	>=dev-python/nbclient-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyarrow-2.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pyarrow-2.0[${PYTHON_USEDEP}] )
	hdfs? ( >=dev-python/pyarrow-2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pygithub-1.55[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pygithub-1.55[${PYTHON_USEDEP}] )
	github? ( >=dev-python/pygithub-1.55[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	all? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	docs? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	>=dev-python/tenacity-5.0.2[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.32.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/attrs-17.4.0[${PYTHON_USEDEP}]
		>=dev-python/azure-datalake-store-0.0.30[${PYTHON_USEDEP}]
		>=dev-python/azure-identity-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/azure-storage-blob-12.1.0[${PYTHON_USEDEP}]
		>=dev-python/black-19.3_beta0[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/botocore[${PYTHON_USEDEP}]
		dev-python/bumpversion[${PYTHON_USEDEP}]
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/codecov[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/gcsfs-0.2.0[${PYTHON_USEDEP}]
		dev-python/google-compute-engine[${PYTHON_USEDEP}]
		>=dev-python/ipython-5.0[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		<dev-python/moto-5.1.0[${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		>=dev-python/pip-18.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-env-0.6.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-1.10[${PYTHON_USEDEP}]
		dev-python/recommonmark[${PYTHON_USEDEP}]
		>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
		>=dev-python/setuptools-38.6.0[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		>=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.31.0[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
