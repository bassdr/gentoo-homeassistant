# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi xdg

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyterlab/"

LICENSE="BSD MIT GPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs docs-screenshots upgrade-extension"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	altair==5.4.1; extra == "docs-screenshots"
	async-lru>=1.0.0
	build; extra == "dev"
	bump2version; extra == "dev"
	copier<10,>=9; extra == "upgrade-extension"
	coverage; extra == "dev"
	coverage; extra == "test"
	hatch; extra == "dev"
	httpx>=0.25.0
	importlib-metadata>=4.8.3; python_version < "3.10"
	importlib-resources>=1.4; python_version < "3.9"
	ipykernel>=6.5.0
	ipython==8.16.1; extra == "docs-screenshots"
	ipywidgets==8.1.5; extra == "docs-screenshots"
	jinja2-time<0.3; extra == "upgrade-extension"
	jinja2>=3.0.3
	jsx-lexer; extra == "docs"
	jupyter-core
	jupyter-lsp>=2.0.0
	jupyter-server<3,>=2.4.0
	jupyterlab-geojson==3.4.0; extra == "docs-screenshots"
	jupyterlab-language-pack-zh-cn==4.2.post3; extra == "docs-screenshots"
	jupyterlab-server<3,>=2.27.1
	matplotlib==3.9.2; extra == "docs-screenshots"
	myst-parser; extra == "docs"
	nbconvert>=7.0.0; extra == "docs-screenshots"
	notebook-shim>=0.2
	packaging
	pandas==2.2.3; extra == "docs-screenshots"
	pre-commit; extra == "dev"
	pydantic<3.0; extra == "upgrade-extension"
	pydata-sphinx-theme>=0.13.0; extra == "docs"
	pytest-check-links; extra == "docs"
	pytest-check-links>=0.7; extra == "test"
	pytest-console-scripts; extra == "test"
	pytest-cov; extra == "dev"
	pytest-cov; extra == "test"
	pytest-jupyter; extra == "docs"
	pytest-jupyter>=0.5.3; extra == "test"
	pytest-timeout; extra == "test"
	pytest-tornasync; extra == "test"
	pytest; extra == "docs"
	pytest>=7.0; extra == "test"
	pyyaml-include<3.0; extra == "upgrade-extension"
	requests-cache; extra == "test"
	requests; extra == "test"
	ruff==0.6.9; extra == "dev"
	scipy==1.14.1; extra == "docs-screenshots"
	setuptools>=40.8.0
	sphinx-copybutton; extra == "docs"
	sphinx<8.1.0,>=1.8; extra == "docs"
	tomli-w<2.0; extra == "upgrade-extension"
	tomli>=1.2.2; python_version < "3.11"
	tornado>=6.2.0
	traitlets
	vega-datasets==0.9.0; extra == "docs-screenshots"
	virtualenv; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	docs-screenshots? ( ~dev-python/altair-5.4.1[${PYTHON_USEDEP}] )
	>=dev-python/async-lru-1.0.0[${PYTHON_USEDEP}]
	upgrade-extension? ( >=dev-python/copier-9[${PYTHON_USEDEP}] <dev-python/copier-10[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.5.0[${PYTHON_USEDEP}]
	docs-screenshots? ( ~dev-python/ipython-8.16.1[${PYTHON_USEDEP}] )
	docs-screenshots? ( ~dev-python/ipywidgets-8.1.5[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	upgrade-extension? ( <dev-python/jinja2-time-0.3[${PYTHON_USEDEP}] )
	docs? ( dev-python/jsx-lexer[${PYTHON_USEDEP}] )
	dev-python/jupyter-core[${PYTHON_USEDEP}]
	>=dev-python/jupyter-lsp-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-2.4.0[${PYTHON_USEDEP}] <dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	docs-screenshots? ( ~dev-python/jupyterlab-geojson-3.4.0[${PYTHON_USEDEP}] )
	docs-screenshots? ( ~dev-python/jupyterlab-language-pack-zh-cn-4.2_p3[${PYTHON_USEDEP}] )
	>=dev-python/jupyterlab-server-2.27.1[${PYTHON_USEDEP}] <dev-python/jupyterlab-server-3[${PYTHON_USEDEP}]
	docs-screenshots? ( ~dev-python/matplotlib-3.9.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs-screenshots? ( >=dev-python/nbconvert-7.0.0[${PYTHON_USEDEP}] )
	>=dev-python/notebook-shim-0.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	docs-screenshots? ( ~dev-python/pandas-2.2.3[${PYTHON_USEDEP}] )
	upgrade-extension? ( <dev-python/pydantic-3.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pydata-sphinx-theme-0.13.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest-check-links[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest-jupyter[${PYTHON_USEDEP}] )
	upgrade-extension? ( <dev-python/pyyaml-include-3.0[${PYTHON_USEDEP}] )
	docs-screenshots? ( ~dev-python/scipy-1.14.1[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.8[${PYTHON_USEDEP}] <dev-python/sphinx-8.1.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	upgrade-extension? ( <dev-python/tomli-w-2.0[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	docs-screenshots? ( ~dev-python/vega-datasets-0.9.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/async-lru-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.5.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	dev-python/jupyter-core[${PYTHON_USEDEP}]
	>=dev-python/jupyter-lsp-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-2.4.0[${PYTHON_USEDEP}]
	<dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-server-2.27.1[${PYTHON_USEDEP}]
	<dev-python/jupyterlab-server-3[${PYTHON_USEDEP}]
	>=dev-python/notebook-shim-0.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-1.2.2[${PYTHON_USEDEP}]
	' 3.10)
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	net-libs/nodejs[npm]
"

BDEPEND="
	dev-python/hatch-jupyter-builder[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.5.3[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-cache[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# These tests call npm and want internet
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_uninstall_core_extension
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_install_and_uninstall_pinned_folder
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_install_and_uninstall_pinned
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_build_custom_minimal_core_config
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_build_custom
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_build_check
	jupyterlab/tests/test_jupyterlab.py::TestExtension::test_build
	jupyterlab/tests/test_build_api.py::TestBuildAPI::test_clear
	jupyterlab/tests/test_build_api.py::TestBuildAPI::test_build
)

EPYTEST_IGNORE=(
	jupyterlab/tests/test_announcements.py
)

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/bump2version[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/hatch[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-check-links-0.7[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.5.3[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-cache[${PYTHON_USEDEP}]
		~dev-python/ruff-0.6.9[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
# TODO: package sphinx_copybutton
#distutils_enable_sphinx docs/source dev-python/sphinx-rtd-theme dev-python/myst-parser

python_install_all() {
	distutils-r1_python_install_all
	mv "${ED}/usr/etc" "${ED}/etc" || die
}
