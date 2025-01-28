# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyaprilaire/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"
DOCS="README.md"
GENERATED_DEPEND="
	dev? ( dev-python/black[${PYTHON_USEDEP}] )
	dev? ( dev-python/bumpver[${PYTHON_USEDEP}] )
	>=dev-python/crc-4[${PYTHON_USEDEP}]
	dev-python/crc[${PYTHON_USEDEP}]
	dev? ( dev-python/isort[${PYTHON_USEDEP}] )
	dev? ( dev-python/pip-tools[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/crc[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
