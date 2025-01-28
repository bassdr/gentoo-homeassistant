# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Style preserving TOML library"
HOMEPAGE="
  https://pypi.org/project/tomlkit/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_configure() {
	grep -q 'build-backend = "poetry' pyproject.toml ||
		die "Upstream changed build-backend, recheck"
	# write a custom pyproject.toml to ease setuptools bootstrap
	cat > pyproject.toml <<-EOF || die
		[build-system]
		requires = ["flit_core >=3.2,<4"]
		build-backend = "flit_core.buildapi"

		[project]
		name = "tomlkit"
		version = "${PV}"
		description = "Style preserving TOML library"
	EOF
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
