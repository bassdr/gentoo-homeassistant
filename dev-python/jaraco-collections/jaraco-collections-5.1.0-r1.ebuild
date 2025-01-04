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

GENERATED_DEPEND="
	dev-python/jaraco-text[${PYTHON_USEDEP}]
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
