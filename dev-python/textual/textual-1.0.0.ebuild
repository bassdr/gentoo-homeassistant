# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="syntax"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/textual/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	markdown-it-py[linkify,plugins]>=2.1.0
	platformdirs<5,>=3.6.0
	rich>=13.3.3
	tree-sitter-bash>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-css>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-go>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-html>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-java>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-javascript>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-json>=0.24.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-markdown>=0.3.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-python>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-regex>=0.24.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-rust>=0.23.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-sql>=0.3.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-toml>=0.6.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-xml>=0.7.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter-yaml>=0.6.0; python_version >= "3.9" and extra == "syntax"
	tree-sitter>=0.23.0; python_version >= "3.9" and extra == "syntax"
	typing-extensions<5.0.0,>=4.4.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/markdown-it-py-2.1.0[linkify,plugins,${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.6.0[${PYTHON_USEDEP}] <dev-python/platformdirs-5[${PYTHON_USEDEP}]
	>=dev-python/rich-13.3.3[${PYTHON_USEDEP}]
	syntax? ( >=dev-python/tree-sitter-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-bash-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-css-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-go-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-html-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-java-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-javascript-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-json-0.24.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-markdown-0.3.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-python-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-regex-0.24.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-rust-0.23.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-sql-0.3.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-toml-0.6.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-xml-0.7.0[${PYTHON_USEDEP}] )
	syntax? ( >=dev-python/tree-sitter-yaml-0.6.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}] <dev-python/typing-extensions-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
