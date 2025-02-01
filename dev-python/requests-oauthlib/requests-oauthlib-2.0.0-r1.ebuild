# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="OAuthlib authentication support for Requests."
HOMEPAGE="
  https://pypi.org/project/requests-oauthlib/
"
SRC_URI="
	https://github.com/requests/requests-oauthlib/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="rsa"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]
	rsa? ( >=dev-python/oauthlib-3.0.0[signedtoken,${PYTHON_USEDEP}] )
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Internet access
		tests/test_core.py::OAuth1Test::testCanPostBinaryData
		tests/test_core.py::OAuth1Test::test_content_type_override
		tests/test_core.py::OAuth1Test::test_url_is_native_str
	)
	local EPYTEST_IGNORE=(
		tests/examples
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
