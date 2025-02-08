# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A small Python package for determining appropriate platform-specific dirs, e.g. a \"user data dir\"."
HOMEPAGE="
  https://pypi.org/project/platformdirs/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs type"
IUSE="${GENERATED_IUSE}"
BDEPEND="
	test? (
		dev-python/appdirs[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_configure() {
	grep -q 'build-backend = "hatchling' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	cat > pyproject.toml <<-EOF || die
		[build-system]
		requires = ["flit_core >=3.2,<4"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "${PN}"
		version = "${PV}"
		description = 'A small Python package for determining appropriate platform-specific dirs, e.g. a "user data dir".'
	EOF
	# sigh
	cat > src/platformdirs/version.py <<-EOF || die
		__version__ = version = '${PV}'
		__version_tuple__ = version_tuple = (${PV//./, })
	EOF
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_mock
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
