# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="tools and library for Habitica restful API (http://habitica.com)"
HOMEPAGE="
  https://pypi.org/project/habitipy/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test emoji +aio"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/plumbum[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/plumbum[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]
		 emoji? ( dev-python/emoji[${PYTHON_USEDEP}] )
		 aio? ( dev-python/aiohttp[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
