# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Api wrapper for Asuswrt https://www.asus.com/ASUSWRT/"
HOMEPAGE="
  https://pypi.org/project/aioasuswrt/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	asyncssh
	check-manifest ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/asyncssh[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/check-manifest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"
# dev-python/setuptools-markdown[${PYTHON_USEDEP}]

