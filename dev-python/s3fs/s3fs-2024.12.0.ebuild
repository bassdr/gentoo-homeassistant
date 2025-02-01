# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="awscli boto3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/s3fs/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiobotocore-3.0.0[${PYTHON_USEDEP}]
	awscli? ( <dev-python/aiobotocore-3.0.0[awscli,${PYTHON_USEDEP}] )
	boto3? ( <dev-python/aiobotocore-3.0.0[boto3,${PYTHON_USEDEP}] )
	!=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}]
	~dev-python/fsspec-2024.12.0*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
