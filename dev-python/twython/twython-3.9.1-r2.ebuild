# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/twython/"
SRC_URI="
	https://github.com/ryanmcgrath/twython/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	requests (>=2.1.0)
	requests-oauthlib (>=0.4.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/responses[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# tests are largely unmaintained and outdated
	tests/test_core.py::TwythonAPITestCase::test_get_lastfunction_header_should_return_header
	tests/test_core.py::TwythonAPITestCase::test_request_should_handle_400_for_missing_auth_data
	tests/test_core.py::TwythonAPITestCase::test_request_should_handle_400_that_is_not_auth_related
	tests/test_core.py::TwythonAPITestCase::test_request_should_handle_401
	tests/test_core.py::TwythonAPITestCase::test_request_should_handle_rate_limit
	tests/test_core.py::TwythonAPITestCase::test_sends_correct_accept_encoding_header
)
