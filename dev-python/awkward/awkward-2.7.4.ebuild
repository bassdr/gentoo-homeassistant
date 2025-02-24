# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/awkward/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	awkward-cpp==44
	fsspec>=2022.11.0
	importlib-metadata>=4.13.0; python_version < '3.12'
	numpy>=1.18.0
	packaging
	typing-extensions>=4.1.0; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/awkward-cpp-44[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2022.11.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
