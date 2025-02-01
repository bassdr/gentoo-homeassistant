# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-ansible/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cairosvg-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/linkchecker-10.3.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-exec-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-include-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.4.2[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-gen-files-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-htmlproofer-plugin-0.10.2[${PYTHON_USEDEP}]
	dev-python/mkdocs-macros-plugin[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-material-9.0.13[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-material-extensions-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-minify-plugin-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-monorepo-plugin-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/mkdocstrings-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/mkdocstrings-python-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.4.0[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-9.9.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"
