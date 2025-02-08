# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Twilio SendGrid library for Python"
HOMEPAGE="
  https://pypi.org/project/sendgrid/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	python-http-client (>=3.2.1)
	starkbank-ecdsa (>=1.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/python-http-client-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/starkbank-ecdsa-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/python-http-client-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/starkbank-ecdsa-1.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
