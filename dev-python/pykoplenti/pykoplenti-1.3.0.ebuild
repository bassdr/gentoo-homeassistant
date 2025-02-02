# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python REST-Client for Kostal Plenticore Solar Inverters"
HOMEPAGE="
  https://pypi.org/project/pykoplenti/
  repository, https://github.com/stegm/pyclient_koplenti
  changelog, https://github.com/stegm/pykoplenti/blob/master/CHANGELOG.md
  issues, https://github.com/stegm/pykoplenti/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	cli? ( >=dev-python/click-7.1[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/prompt-toolkit-3.0[${PYTHON_USEDEP}] )
	~dev-python/pycryptodome-3.19[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
