# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_PN="jaraco.functools"
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Functools like those found in stdlib"
HOMEPAGE="
  https://pypi.org/project/jaraco.functools/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/more-itertools-0.12.0-r1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/jaraco-classes[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_configure() {
	grep -q 'build-backend = "setuptools' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	cat > pyproject.toml <<-EOF || die
		[build-system]
		requires = ["flit_core >=3.2,<4"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "jaraco.functools"
		version = "${PV}"
		description = "Functools like those found in stdlib"
	EOF
}

python_install() {
	distutils-r1_python_install
	# rename to workaround a bug in pkg_resources
	# https://bugs.gentoo.org/834522
	mv "${D}$(python_get_sitedir)"/jaraco{_,.}functools-${PV}.dist-info || die
}
