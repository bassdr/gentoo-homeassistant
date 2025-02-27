# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="The uncompromising code formatter."
HOMEPAGE="
  https://pypi.org/project/black/
  Documentation, https://black.readthedocs.io/
  Changelog, https://github.com/psf/black/blob/main/CHANGES.md
  Repository, https://github.com/psf/black
  Issues, https://github.com/psf/black/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="colorama d jupyter uvloop"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiohttp>=3.10; extra == 'd'
	click>=8.0.0
	colorama>=0.4.3; extra == 'colorama'
	ipython>=7.8.0; extra == 'jupyter'
	mypy-extensions>=0.4.3
	packaging>=22.0
	pathspec>=0.9.0
	platformdirs>=2
	tokenize-rt>=3.2.0; extra == 'jupyter'
	tomli>=1.1.0; python_version < '3.11'
	typing-extensions>=4.0.1; python_version < '3.11'
	uvloop>=0.15.2; extra == 'uvloop'
"
GENERATED_RDEPEND="${RDEPEND}
	d? ( >=dev-python/aiohttp-3.10[${PYTHON_USEDEP}] )
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	colorama? ( >=dev-python/colorama-0.4.3[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipython-7.8.0[${PYTHON_USEDEP}] )
	>=dev-python/mypy-extensions-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2[${PYTHON_USEDEP}]
	jupyter? ( >=dev-python/tokenize-rt-3.2.0[${PYTHON_USEDEP}] )
	uvloop? ( >=dev-python/uvloop-0.15.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/aiohttp-3.10[${PYTHON_USEDEP}]
		dev-python/aiohttp-cors[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# pytest-forked to workaround fd leakage in blackd
	# https://github.com/psf/black/issues/4504
	epytest -p pytest_forked --forked
}

pkg_postinst() {
	optfeature "blackd - HTTP API for black" \
		"dev-python/aiohttp dev-python/aiohttp-cors"
}
