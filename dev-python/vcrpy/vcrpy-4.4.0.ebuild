# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/vcrpy/"
SRC_URI="
	https://github.com/kevin1024/vcrpy/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML
	six (>=1.5)
	urllib3 (<2) ; python_version < "3.10"
	wrapt
	yarl
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/six-1.5[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httplib2-0.9.1[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/requests-2.16.2[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-httpbin-2.0.0-r1[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# these tests are failing with recent dev-python/werkzeug; losely related:
		# https://github.com/kevin1024/vcrpy/issues/645
		tests/integration/test_record_mode.py::test_new_episodes_record_mode_two_times
		tests/integration/test_urllib2.py::test_random_body
		tests/integration/test_urllib2.py::test_multiple_requests
		# Internet
		"tests/integration/test_urllib3.py::test_post[https]"
	)

	local EPYTEST_IGNORE=(
		# requires boto3
		tests/integration/test_boto3.py
		# Internet
		tests/integration/test_tornado.py
		tests/integration/test_aiohttp.py
	)

	local -x REQUESTS_CA_BUNDLE=$("${EPYTHON}" -m pytest_httpbin.certs)
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -m 'not online' -p httpbin -p rerunfailures --reruns=5
}
