# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="all development documentation repl serial simulator"
IUSE="${GENERATED_IUSE} serial test repl simulator"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	Sphinx>=5.3.0; extra == 'documentation'
	aiohttp>=3.8.6; python_version < '3.12' and extra == 'simulator'
	aiohttp>=3.9.0b0; python_version == '3.12' and extra == 'simulator'
	build>=1.1.1; extra == 'development'
	codespell>=2.2.6; extra == 'development'
	coverage>=7.4.3; extra == 'development'
	mypy>=1.9.0; extra == 'development'
	pylint>=3.1.0; extra == 'development'
	pymodbus-repl>=2.0.3; extra == 'repl'
	pymodbus[development,documentation,repl,serial,simulator]; extra == 'all'
	pyserial>=3.5; extra == 'serial'
	pytest-asyncio>=0.23.5.post1; extra == 'development'
	pytest-cov>=4.1.0; extra == 'development'
	pytest-profiling>=1.7.0; extra == 'development'
	pytest-timeout>=2.3.1; extra == 'development'
	pytest-xdist>=3.5.0; extra == 'development'
	pytest>=8.1.0; extra == 'development'
	recommonmark>=0.7.1; extra == 'documentation'
	ruff>=0.3.3; extra == 'development'
	sphinx-rtd-theme>=1.1.1; extra == 'documentation'
	twine>=5.0.0; extra == 'development'
	types-Pygments; extra == 'development'
	types-pyserial; extra == 'development'
"
GENERATED_RDEPEND="${RDEPEND}
	simulator? ( $(python_gen_cond_dep '>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}]' python3_12) )
	development? ( >=dev-python/build-1.1.1[${PYTHON_USEDEP}] )
	development? ( >=dev-python/codespell-2.2.6[${PYTHON_USEDEP}] )
	development? ( >=dev-python/coverage-7.4.3[${PYTHON_USEDEP}] )
	development? ( >=dev-python/mypy-1.9.0[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pylint-3.1.0[${PYTHON_USEDEP}] )
	all? ( dev-python/pymodbus[development,documentation,repl,serial,simulator,${PYTHON_USEDEP}] )
	repl? ( >=dev-python/pymodbus-repl-2.0.3[${PYTHON_USEDEP}] )
	serial? ( >=dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-8.1.0[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-asyncio-0.23.5_p1[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-profiling-1.7.0[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}] )
	development? ( >=dev-python/pytest-xdist-3.5.0[${PYTHON_USEDEP}] )
	documentation? ( >=dev-python/recommonmark-0.7.1[${PYTHON_USEDEP}] )
	development? ( >=dev-python/ruff-0.3.3[${PYTHON_USEDEP}] )
	documentation? ( >=dev-python/sphinx-5.3.0[${PYTHON_USEDEP}] )
	documentation? ( >=dev-python/sphinx-rtd-theme-1.1.1[${PYTHON_USEDEP}] )
	development? ( >=dev-python/twine-5.0.0[${PYTHON_USEDEP}] )
	development? ( dev-python/types-pygments[${PYTHON_USEDEP}] )
	development? ( dev-python/types-pyserial[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
