# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_PN=${PN/-/.}
PYTHON_COMPAT=( python3_{11..14} python3_{13,14}t pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Module for text manipulation"
HOMEPAGE="
  https://pypi.org/project/jaraco-text/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~ppc-macos ~x64-macos ~x64-solaris"

GENERATED_IUSE="doc inflect test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	autocommand
	furo; extra == 'doc'
	importlib-resources; python_version < '3.9'
	inflect; extra == 'inflect'
	jaraco.context>=4.1
	jaraco.functools
	jaraco.packaging>=9.3; extra == 'doc'
	jaraco.tidelift>=1.4; extra == 'doc'
	more-itertools
	pathlib2; python_version < '3.10' and extra == 'test'
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-enabler>=2.2; extra == 'test'
	pytest-mypy; extra == 'test'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'test'
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	inflect? ( dev-python/inflect[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-context-4.1[${PYTHON_USEDEP}]
	dev-python/jaraco-functools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
		name = "jaraco.text"
		version = "${PV}"
		description = "Module for text manipulation"
	EOF

	# remove CLI tools, they have annoying deps, no entry points
	# and since there are dashes in their names, they can't be imported
	# anyway
	rm jaraco/text/*-*.py || die
}

python_install() {
	distutils-r1_python_install
	# rename to workaround a bug in pkg_resources
	# https://bugs.gentoo.org/834522
	mv "${D}$(python_get_sitedir)"/jaraco{_,.}text-${PV}.dist-info || die
}
