# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all kubernetes"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kfp/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/click-9[${PYTHON_USEDEP}]
	all? ( dev-python/docker[${PYTHON_USEDEP}] )
	<dev-python/docstring-parser-1[${PYTHON_USEDEP}]
	!=dev-python/google-api-core-2.0*[${PYTHON_USEDEP}]
	<dev-python/google-auth-3[${PYTHON_USEDEP}]
	<dev-python/google-cloud-storage-3[${PYTHON_USEDEP}]
	all? ( <dev-python/kfp-kubernetes-2[${PYTHON_USEDEP}] )
	kubernetes? ( <dev-python/kfp-kubernetes-2[${PYTHON_USEDEP}] )
	=dev-python/kfp-pipeline-spec-0.6.0[${PYTHON_USEDEP}]
	<dev-python/kfp-server-api-2.4.0[${PYTHON_USEDEP}]
	<dev-python/kubernetes-31[${PYTHON_USEDEP}]
	<dev-python/protobuf-5[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	<dev-python/requests-toolbelt-1[${PYTHON_USEDEP}]
	<dev-python/tabulate-1[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	<dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
