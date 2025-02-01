# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "sphinx-theme-builder" "0.2.0b2")"
S="${WORKDIR}/sphinx-theme-builder-0.2.0b2"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-theme-builder/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	cli? ( dev-python/build[${PYTHON_USEDEP}] )
	cli? ( dev-python/click[${PYTHON_USEDEP}] )
	dev-python/nodeenv[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyproject-metadata[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	cli? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
