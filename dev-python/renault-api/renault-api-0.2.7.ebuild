# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Renault API"
HOMEPAGE="
  https://pypi.org/project/renault-api/
  Changelog, https://github.com/hacf-fr/renault-api/releases
  Documentation, https://renault-api.readthedocs.io
  Repository, https://github.com/hacf-fr/renault-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	cli? ( >=dev-python/click-8.0.1[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-42.0.5[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	cli? ( >=dev-python/dateparser-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/marshmallow-dataclass-8.2.0[${PYTHON_USEDEP}]
	dev-python/marshmallow-dataclass[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	<dev-python/six-2.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	cli? ( >=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.5[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-dataclass-8.2.0[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.16[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
