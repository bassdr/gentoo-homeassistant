# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-server-terminals/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mistune-4.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	docs? ( dev-python/packaging[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-openapi[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxemoji[${PYTHON_USEDEP}] )
	>=dev-python/terminado-0.8.3[${PYTHON_USEDEP}]
	docs? ( dev-python/tornado[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/terminado[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/jupyter-server[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# Fails if shell is not bash
	tests/test_terminal.py::test_terminal_create_with_cwd
	tests/test_terminal.py::test_terminal_create_with_relative_cwd
)

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/jupyter-server-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-jupyter-0.5.3[server,${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
)"

python_install_all() {
	distutils-r1_python_install_all
	mv "${ED}/usr/etc" "${ED}/etc" || die
}
