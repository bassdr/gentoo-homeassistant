# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sweeps/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML
	jsonref (>=0.2)
	jsonschema (>=3.2.0)
	numpy (>=1.15)
	pydantic (>=1.8.2)
	scikit-learn (>=0.24.2) ; python_version == "3.6"
	scikit-learn (>=1.0) ; python_version > "3.6"
	scipy (>=1.5.4)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jsonref-0.2[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.8.2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
