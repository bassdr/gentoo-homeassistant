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
GENERATED_DEPEND="${PYTHON_DEPS}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/importlib-resources-1.3[${PYTHON_USEDEP}]
	perf? ( dev-python/ipython[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.6.4[${PYTHON_USEDEP}]
	>=dev-python/zipp-3.20[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
BDEPEND+=" test? (
	dev-python/flufl-flake8[${PYTHON_USEDEP}]
	>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyfakefs[${PYTHON_USEDEP}]
	!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	>=dev-python/pytest-perf-0.9.2[${PYTHON_USEDEP}]
)"

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
