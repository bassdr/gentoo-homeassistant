# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A utility belt for advanced users of python-requests"
HOMEPAGE="
  https://pypi.org/project/requests-toolbelt/
  Changelog, https://github.com/requests/toolbelt/blob/master/HISTORY.rst
  Source, https://github.com/requests/toolbelt
"
SRC_URI="
	https://github.com/requests/toolbelt/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${P#requests-}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test-rust"

REQUIRES_DIST="
	requests (<3.0.0,>=2.0.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.0.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/betamax[${PYTHON_USEDEP}]
		test-rust? (
			dev-python/cryptography[${PYTHON_USEDEP}]
			dev-python/pyopenssl[${PYTHON_USEDEP}]
			dev-python/trustme[${PYTHON_USEDEP}]
		)
	)
"

DOCS=( AUTHORS.rst HISTORY.rst README.rst )

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Internet
		tests/test_multipart_encoder.py::TestFileFromURLWrapper::test_no_content_length_header
		tests/test_multipart_encoder.py::TestFileFromURLWrapper::test_read_file
		tests/test_multipart_encoder.py::TestMultipartEncoder::test_reads_file_from_url_wrapper
		# tests themself are broken with newer urllib3
		tests/test_dump.py::TestDumpRealResponses::test_dump_{all,response}
		tests/test_sessions.py::TestBasedSession::test_{prepared_,}request_{with,override}_base
	)
	local EPYTEST_IGNORE=()

	if ! has_version "dev-python/cryptography[${PYTHON_USEDEP}]" ||
		! has_version "dev-python/pyopenssl[${PYTHON_USEDEP}]" ||
		! has_version "dev-python/trustme[${PYTHON_USEDEP}]"
	then
		EPYTEST_IGNORE+=(
			tests/test_x509_adapter.py
		)
	fi

	epytest
}
