# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rope/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="doc"

RDEPEND="
	>=dev-python/pytoolconfig-1.2.2[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	build ; extra == 'dev'
	pytest ; extra == 'dev'
	pytest-timeout ; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	# https://github.com/python-rope/rope/pull/809
	"${FILESDIR}/${PN}-1.13.0-python3.13.patch"
)

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# our venv style confuses this comparison
	ropetest/contrib/autoimport/utilstest.py::test_get_package_source_typing
	ropetest/contrib/autoimport/utilstest.py::test_get_package_tuple_typing
	ropetest/contrib/autoimport/utilstest.py::test_get_package_tuple_compiled
	# TODO
	ropetest/contrib/autoimport/autoimporttest.py::TestQueryUsesIndexes::test_search_by_name_like_uses_index
	ropetest/contrib/autoimport/autoimporttest.py::TestQueryUsesIndexes::test_search_module_like_uses_index
)
