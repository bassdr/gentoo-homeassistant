# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all sphinx"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mosaicml-cli/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/argcomplete-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/arrow-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/build-0.10.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/docutils-0.17.0[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/docutils-0.17.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/furo-2022.9.29[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/furo-2022.9.29[${PYTHON_USEDEP}] )
	>=dev-python/gql-3.4.0[websockets,${PYTHON_USEDEP}]
	all? ( >=dev-python/isort-5.9.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/myst-parser-0.16.1[${PYTHON_USEDEP}] )
	>=dev-python/prompt-toolkit-3.0.29[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/pylint-2.12.2[${PYTHON_USEDEP}] )
	all? ( ~dev-python/pyright-1.1.256[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-mock-3.7.0[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/questionary-1.10.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/radon-5.1.0[${PYTHON_USEDEP}] )
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/rich-12.6.0[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.21[${PYTHON_USEDEP}]
	all? ( ~dev-python/sphinx-4.4.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-4.4.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-argparse-0.4.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-argparse-0.4.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-external-toc-0.3.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-external-toc-0.3.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-markdown-tables-0.0.17[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-markdown-tables-0.0.17[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-panels-0.6.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-panels-0.6.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-applehelp-1.0.2[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-applehelp-1.0.2[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-devhelp-1.0.2[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-devhelp-1.0.2[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-htmlhelp-2.0.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-htmlhelp-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinxcontrib-images-0.9.4[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/sphinxcontrib-images-0.9.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-katex-0.9.4[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-katex-0.9.4[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-qthelp-1.0.3[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-qthelp-1.0.3[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxcontrib-serializinghtml-1.1.5[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxcontrib-serializinghtml-1.1.5[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxemoji-0.2.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxemoji-0.2.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/sphinxext-opengraph-0.8.2[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinxext-opengraph-0.8.2[${PYTHON_USEDEP}] )
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/toml-0.10.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/twine-4.0.2[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.23[${PYTHON_USEDEP}]
	>=dev-python/validators-0.20.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/yapf-0.33.0[${PYTHON_USEDEP}] )
	all? ( >=dev-vcs/pre-commit-2.17.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/build-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/isort-5.9.3[${PYTHON_USEDEP}]
	>=dev-python/pylint-2.12.2[${PYTHON_USEDEP}]
	~dev-python/pyright-1.1.256[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/radon-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/twine-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/yapf-0.33.0[${PYTHON_USEDEP}]
	>=dev-vcs/pre-commit-2.17.0[${PYTHON_USEDEP}]
)"
