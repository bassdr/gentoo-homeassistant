# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
# NB: this package extends beyond built-in importlib stuff in py3.8+
# new entry_point API not yet included in cpython release
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/importlib-metadata/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="check cover doc enabler perf type"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	flufl.flake8; extra == 'test'
	furo; extra == 'doc'
	importlib_resources>=1.3; python_version < '3.9' and extra == 'test'
	ipython; extra == 'perf'
	jaraco.packaging>=9.3; extra == 'doc'
	jaraco.test>=5.4; extra == 'test'
	jaraco.tidelift>=1.4; extra == 'doc'
	packaging; extra == 'test'
	pyfakefs; extra == 'test'
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'check'
	pytest-cov; extra == 'cover'
	pytest-enabler>=2.2; extra == 'enabler'
	pytest-mypy; extra == 'type'
	pytest-perf>=0.9.2; extra == 'test'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'check'
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
	typing-extensions>=3.6.4; python_version < '3.8'
	zipp>=3.20
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	perf? ( dev-python/ipython[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	>=dev-python/zipp-3.20[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/zipp-3.20[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyfakefs[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flufl-flake8[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-perf-0.9.2[${PYTHON_USEDEP}]
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
		name = "importlib_metadata"
		version = "${PV}"
		description = "Read metadata from Python packages"
	EOF
}
