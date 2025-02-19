# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12,13{,t}} )

CRATES="
	asn1@0.20.0
	asn1_derive@0.20.0
	autocfg@1.4.0
	bitflags@2.6.0
	block-buffer@0.10.4
	byteorder@1.5.0
	cc@1.2.2
	cfg-if@1.0.0
	cpufeatures@0.2.16
	crypto-common@0.1.6
	digest@0.10.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	generic-array@0.14.7
	getrandom@0.2.15
	heck@0.5.0
	hex@0.4.3
	indoc@2.0.5
	itoa@1.0.14
	libc@0.2.167
	memoffset@0.9.1
	once_cell@1.20.2
	openssl-macros@0.1.1
	openssl-src@300.4.1+3.4.0
	openssl-sys@0.9.104
	openssl@0.10.68
	pkg-config@0.3.31
	portable-atomic@1.10.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.92
	pyo3-build-config@0.23.3
	pyo3-ffi@0.23.3
	pyo3-macros-backend@0.23.3
	pyo3-macros@0.23.3
	pyo3@0.23.3
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	self_cell@1.1.0
	sha2@0.10.8
	shlex@1.3.0
	syn@2.0.90
	target-lexicon@0.12.16
	typenum@1.17.0
	unicode-ident@1.0.14
	unindent@0.2.3
	vcpkg@0.2.15
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

declare -A GIT_CRATES=(
	[cryptography-x509]='https://github.com/pyca/cryptography;f299a48153650f2dd87716343f2daa7cd39a1f59;cryptography-%commit%/src/rust/cryptography-x509'
)

inherit cargo distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rfc3161-client/
  Homepage, https://pypi.org/project/rfc3161-client
  Documentation, https://trailofbits.github.io/rfc3161-client/
  Issues, https://github.com/trailofbits/rfc3161-client/issues
  Source, https://github.com/trailofbits/rfc3161-client
"
# no tests in sdist, as of 0.0.4
SRC_URI="
	https://github.com/trailofbits/rfc3161-client/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-3.0
"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage[toml]; extra == 'test'
	cryptography<45,>=43
	interrogate; extra == 'lint'
	maturin<2.0,>=1.7; extra == 'dev'
	pretend; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	rfc3161-client[doc,lint,test]; extra == 'dev'
	ruff<0.9,>=0.7; extra == 'lint'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-43[${PYTHON_USEDEP}] <dev-python/cryptography-45[${PYTHON_USEDEP}]
	lint? ( dev-python/interrogate[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/ruff-0.7[${PYTHON_USEDEP}] <dev-python/ruff-0.9[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		>=dev-python/maturin-1.7[${PYTHON_USEDEP}] <dev-python/maturin-2.0[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/rfc3161-client[doc,lint,test,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest

	cargo_src_test
}
