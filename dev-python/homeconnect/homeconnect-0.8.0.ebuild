# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python client for the BSH Home Connect REST API"
HOMEPAGE="
  https://pypi.org/project/homeconnect/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	testing? ( dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
