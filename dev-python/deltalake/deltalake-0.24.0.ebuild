# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="devel lakefs pandas polars pyspark"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deltalake/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-storage-blob==12.20.0; extra == 'devel'
	delta-spark; extra == 'pyspark'
	lakefs==0.8.0; extra == 'lakefs'
	mypy==1.10.1; extra == 'devel'
	numpy==1.26.4; extra == 'pyspark'
	packaging>=20; extra == 'devel'
	pandas; extra == 'pandas'
	pip>=24.0; extra == 'devel'
	polars==1.17.1; extra == 'polars'
	pyarrow>=16
	pyspark; extra == 'pyspark'
	pytest-benchmark; extra == 'devel'
	pytest-cov; extra == 'devel'
	pytest-mock; extra == 'devel'
	pytest-timeout; extra == 'devel'
	pytest; extra == 'devel'
	ruff==0.5.2; extra == 'devel'
	sphinx-rtd-theme; extra == 'devel'
	sphinx<=4.5; extra == 'devel'
	toml; extra == 'devel'
	wheel; extra == 'devel'
"
GENERATED_RDEPEND="${RDEPEND}
	devel? ( ~dev-python/azure-storage-blob-12.20.0[${PYTHON_USEDEP}] )
	pyspark? ( dev-python/delta-spark[${PYTHON_USEDEP}] )
	lakefs? ( ~dev-python/lakefs-0.8.0[${PYTHON_USEDEP}] )
	devel? ( ~dev-python/mypy-1.10.1[${PYTHON_USEDEP}] )
	pyspark? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	devel? ( >=dev-python/packaging-20[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	devel? ( >=dev-python/pip-24.0[${PYTHON_USEDEP}] )
	polars? ( ~dev-python/polars-1.17.1[${PYTHON_USEDEP}] )
	>=dev-python/pyarrow-16[${PYTHON_USEDEP}]
	pyspark? ( dev-python/pyspark[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	devel? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	devel? ( ~dev-python/ruff-0.5.2[${PYTHON_USEDEP}] )
	devel? ( <=dev-python/sphinx-4.5[${PYTHON_USEDEP}] )
	devel? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	devel? ( dev-python/toml[${PYTHON_USEDEP}] )
	devel? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
