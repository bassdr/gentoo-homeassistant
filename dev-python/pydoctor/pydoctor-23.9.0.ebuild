# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs rst"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydoctor/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/astor[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/cachecontrol[filecache,${PYTHON_USEDEP}]
	dev-python/configargparse[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.17[${PYTHON_USEDEP}]
	rst? ( dev-python/docutils[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	~dev-python/lunr-0.6.2[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-argparse[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	dev-python/toml[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
	<dev-python/urllib3-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/bs4[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/cython-test-exception-raiser[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.18.1[${PYTHON_USEDEP}]
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-subtests[${PYTHON_USEDEP}]
	<dev-python/sphinx-7.0.0[${PYTHON_USEDEP}]
)"
