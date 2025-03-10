# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Mock out requests made by ClientSession from aiohttp package"
HOMEPAGE="
  https://pypi.org/project/aioresponses/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.3.0
	packaging>=22.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		dev-python/ddt[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# These tests require Internet access
	tests/test_aioresponses.py::AIOResponsesTestCase::test_address_as_instance_of_url_combined_with_pass_through
	tests/test_aioresponses.py::AIOResponsesTestCase::test_pass_through_with_origin_params
	tests/test_aioresponses.py::AIOResponseRedirectTest::test_pass_through_unmatched_requests
)
