# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_PN="jaraco.collections"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Collection objects similar to those in stdlib by jaraco"
HOMEPAGE="
  https://pypi.org/project/jaraco.collections/
  Source, https://github.com/jaraco/jaraco.collections
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="check cover doc enabler test type"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/jaraco-text[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	test? ( !=dev-python/pytest-8.1*[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/jaraco-text[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_configure() {
	grep -q 'build-backend = "setuptools' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	sed -i -e \
		's/build-backend = .*/build-backend = "flit_core.buildapi"/' \
		-e '/^name = /a\' -e "version = \"${PV}\"" \
		-e '/^dynamic =/d' \
		pyproject.toml || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
