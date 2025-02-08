# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Python HTTP for Humans."
HOMEPAGE="
  https://pypi.org/project/requests/
  Documentation, https://requests.readthedocs.io
  Source, https://github.com/psf/requests
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="socks use-chardet-on-py3"
IUSE="${GENERATED_IUSE} socks5 test-rust"

REQUIRES_DIST="
	PySocks!=1.5.7,>=1.5.6; extra == "socks"
	certifi>=2017.4.17
	chardet<6,>=3.0.2; extra == "use-chardet-on-py3"
	charset-normalizer<4,>=2
	idna<4,>=2.5
	urllib3<3,>=1.21.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	use-chardet-on-py3? ( >=dev-python/chardet-3.0.2[${PYTHON_USEDEP}] <dev-python/chardet-6[${PYTHON_USEDEP}] )
	>=dev-python/charset-normalizer-2[${PYTHON_USEDEP}] <dev-python/charset-normalizer-4[${PYTHON_USEDEP}]
	>=dev-python/idna-2.5[${PYTHON_USEDEP}] <dev-python/idna-4[${PYTHON_USEDEP}]
	socks? ( >=dev-python/pysocks-1.5.6[${PYTHON_USEDEP}] !~dev-python/pysocks-1.5.7[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.21.1[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	<dev-python/charset-normalizer-4[${PYTHON_USEDEP}]
	<dev-python/idna-4[${PYTHON_USEDEP}]
	<dev-python/urllib3-3[${PYTHON_USEDEP}]
	socks5? ( >=dev-python/pysocks-1.5.6[${PYTHON_USEDEP}] )
"

BDEPEND="
	test? (
		>=dev-python/pytest-httpbin-2.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		>=dev-python/pysocks-1.5.6[${PYTHON_USEDEP}]
		test-rust? (
			dev-python/trustme[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Internet (doctests)
		requests/__init__.py::requests
		requests/api.py::requests.api.request
		requests/models.py::requests.models.PreparedRequest
		requests/sessions.py::requests.sessions.Session
		# require IPv4 interface in 10.* range
		tests/test_requests.py::TestTimeout::test_connect_timeout
		tests/test_requests.py::TestTimeout::test_total_timeout_connect
		# TODO: openssl?
		tests/test_requests.py::TestRequests::test_pyopenssl_redirect
		# flask-2
		tests/test_requests.py::TestRequests::test_cookie_sent_on_redirect
		tests/test_requests.py::TestRequests::test_cookie_removed_on_expire
		tests/test_requests.py::TestPreparingURLs::test_redirecting_to_bad_url
	)

	case ${EPYTHON} in
		python3.13)
			;&
		python3.12)
			EPYTEST_DESELECT+=(
				# different repr()
				requests/utils.py::requests.utils.from_key_val_list
			)
			;;
	esac

	if ! has_version "dev-python/trustme[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_requests.py::TestRequests::test_https_warnings
		)
	fi

	epytest
}
