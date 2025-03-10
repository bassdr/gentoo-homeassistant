# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 4.1.9b1)"
S="${WORKDIR}/${PN}-4.1.9b1"

DESCRIPTION="The official python SDK for Linode API v4"
HOMEPAGE="
  https://pypi.org/project/linode-api/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	future
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/packages=find_packages(exclude=\['contrib', 'docs', 'tests'\])/packages=find_packages(exclude=['contrib', 'docs', 'test', 'test.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
