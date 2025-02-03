# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/awscli/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	=dev-python/botocore-1.36.11[${PYTHON_USEDEP}]
	<dev-python/colorama-0.4.7[${PYTHON_USEDEP}]
	<dev-python/docutils-0.17[${PYTHON_USEDEP}]
	<dev-python/pyyaml-6.1[${PYTHON_USEDEP}]
	<dev-python/rsa-4.8[${PYTHON_USEDEP}]
	<dev-python/s3transfer-0.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
