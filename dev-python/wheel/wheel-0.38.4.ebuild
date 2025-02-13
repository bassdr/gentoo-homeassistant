# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A built-package format for Python"
HOMEPAGE="
  https://pypi.org/project/wheel/
  Documentation, https://wheel.readthedocs.io/
  Changelog, https://wheel.readthedocs.io/en/stable/news.html
  Issue Tracker, https://github.com/pypa/wheel/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/setuptools[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# fails if any setuptools plugin imported the module first
	tests/test_bdist_wheel.py::test_deprecated_import
)

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-3.0.0[${PYTHON_USEDEP}]
)"

src_prepare() {
	distutils-r1_src_prepare

	# unbundle packaging
	rm -r src/wheel/vendored || die
	find -name '*.py' -exec sed -i \
		-e 's:wheel\.vendored\.::' \
		-e 's:\.\+vendored\.::' {} + || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
