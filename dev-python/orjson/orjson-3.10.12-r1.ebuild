# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12,13,13t} )

CRATES="
	associative-cache@2.0.0
	bytecount@0.6.8
	castaway@0.2.3
	cc@1.2.1
	cfg-if@1.0.0
	compact_str@0.8.0
	crunchy@0.2.2
	encoding_rs@0.8.35
	gimli@0.31.1
	half@2.4.1
	itoa@1.0.13
	itoap@1.0.1
	jiff@0.1.14
	libc@0.2.164
	memchr@2.7.4
	once_cell@1.20.2
	proc-macro2@1.0.92
	quote@1.0.37
	rustversion@1.0.18
	ryu@1.0.18
	serde@1.0.215
	serde_derive@1.0.215
	serde_json@1.0.133
	shlex@1.3.0
	simdutf8@0.1.5
	smallvec@1.13.2
	static_assertions@1.1.0
	syn@2.0.89
	target-lexicon@0.12.16
	unicode-ident@1.0.14
	unwinding@0.2.4
	uuid@1.11.0
	version_check@0.9.5
	xxhash-rust@0.8.12
"

RUST_MIN_VER="1.74.1"

inherit cargo distutils-r1 pypi

DESCRIPTION="Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy"
HOMEPAGE="
  https://pypi.org/project/orjson/
  Documentation, https://github.com/ijl/orjson
  Changelog, https://github.com/ijl/orjson/blob/master/CHANGELOG.md
"
SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 MIT Unicode-3.0
"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/arrow[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
		' 'python3*')
	)
"

QA_FLAGS_IGNORED=".*"

distutils_enable_tests pytest

export UNSAFE_PYO3_SKIP_VERSION_CHECK=1

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}