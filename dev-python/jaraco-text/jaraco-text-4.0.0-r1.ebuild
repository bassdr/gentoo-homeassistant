# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Module for text manipulation"
HOMEPAGE="
  https://pypi.org/project/jaraco-text/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

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
	dev-python/autocommand[${PYTHON_USEDEP}]
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
	>=dev-python/jaraco-context-4.1.1-r1[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.5.0-r1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
