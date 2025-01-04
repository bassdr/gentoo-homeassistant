# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A fully featured modbus protocol stack in python"
HOMEPAGE="
  https://pypi.org/project/pymodbus/
  Homepage, https://github.com/pymodbus-dev/pymodbus/
  Source Code, https://github.com/pymodbus-dev/pymodbus
  Bug Reports, https://github.com/pymodbus-dev/pymodbus/issues
  Docs: Dev, https://pymodbus.readthedocs.io/en/latest/?badge=latest
  Discord, https://discord.gg/vcP8qAz2
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="serial test repl simulator"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	serial? (
		>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	)
	simulator? (
		$(python_gen_cond_dep '>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]' python3_12)
	)
	repl? (
		>=dev-python/pymodbus-repl-2.0.3[${PYTHON_USEDEP}]
	)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-pyhton/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
