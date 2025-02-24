# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/notebook-shim/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	jupyter-server<3,>=1.8
	pytest-console-scripts; extra == 'test'
	pytest-jupyter; extra == 'test'
	pytest-tornasync; extra == 'test'
	pytest; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jupyter-server-1.8[${PYTHON_USEDEP}] <dev-python/jupyter-server-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-1.8[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_tornasync.plugin
}

src_install() {
	distutils-r1_src_install
	mv "${ED}/usr/etc" "${ED}/etc" || die
}
