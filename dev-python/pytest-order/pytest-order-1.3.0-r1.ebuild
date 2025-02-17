# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-order/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pytest>=5.0; python_version < '3.10'
	pytest>=6.2.4; python_version >= '3.10'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-6.2.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-6.4.2[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source

python_test() {
	local EPYTEST_DESELECT=(
		# these require pytest-dependency
		tests/test_dependency.py::test_order_dependencies_no_auto_mark
		tests/test_dependency.py::test_order_dependencies_auto_mark
		tests/test_order_group_scope_dep.py::test_class_group_scope_module_scope
		tests/test_order_group_scope_named_dep.py::test_class_group_scope_module_scope
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_order.plugin,xdist.plugin,pytest_mock
	epytest
}
