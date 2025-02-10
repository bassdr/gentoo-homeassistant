# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
# TODO: replace with requests-unixsocket2?
HOMEPAGE="
  https://pypi.org/project/requests-unixsocket/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	requests (>=1.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		dev-python/waitress[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	# https://github.com/msabramo/requests-unixsocket/pull/69
	"${FILESDIR}/${P}-urllib3-2.patch"
	# https://github.com/msabramo/requests-unixsocket/pull/72
	"${FILESDIR}/${P}-requests-2.32.2.patch"
)

distutils_enable_tests pytest
