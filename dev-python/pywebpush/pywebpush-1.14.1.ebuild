# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="WebPush publication library"
HOMEPAGE="
  https://pypi.org/project/pywebpush/
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/http-ece-1.1.0[${PYTHON_USEDEP}]
	dev-python/http-ece[${PYTHON_USEDEP}]
	>=dev-python/py-vapid-1.7.0[${PYTHON_USEDEP}]
	dev-python/py-vapid[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/six-1.15.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/http-ece-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/py-vapid-1.7.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
