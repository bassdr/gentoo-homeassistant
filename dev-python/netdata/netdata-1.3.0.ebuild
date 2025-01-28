# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with Netdata"
HOMEPAGE="
  https://pypi.org/project/netdata/
  Repository, https://github.com/home-assistant-ecosystem/python-netdata
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	<dev-python/yarl-2.0.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.8.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
