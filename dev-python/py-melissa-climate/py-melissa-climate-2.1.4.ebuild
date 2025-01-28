# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Api wrapper for Melissa Climate http://seemelissa.com"
HOMEPAGE="
  https://pypi.org/project/py-melissa-climate/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/mock[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-futures[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-futures[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools-markdown[${PYTHON_USEDEP}]
	dev-python/pypandoc[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
src_prepare() {
	eapply "${FILESDIR}"/fix-setup-py.patch
	eapply_user
}
distutils_enable_tests unittest
