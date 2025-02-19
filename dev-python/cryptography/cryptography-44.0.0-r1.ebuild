# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CARGO_OPTIONAL=yes
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

CRATES="
	asn1@0.20.0
	asn1_derive@0.20.0
	autocfg@1.4.0
	base64@0.22.1
	bitflags@2.6.0
	cc@1.2.1
	cfg-if@1.0.0
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	heck@0.5.0
	indoc@2.0.5
	itoa@1.0.14
	libc@0.2.166
	memoffset@0.9.1
	once_cell@1.20.2
	openssl-macros@0.1.1
	openssl-sys@0.9.104
	openssl@0.10.68
	pem@3.0.4
	pkg-config@0.3.31
	portable-atomic@1.10.0
	proc-macro2@1.0.92
	pyo3-build-config@0.23.2
	pyo3-ffi@0.23.2
	pyo3-macros-backend@0.23.2
	pyo3-macros@0.23.2
	pyo3@0.23.2
	quote@1.0.37
	self_cell@1.0.4
	shlex@1.3.0
	syn@2.0.89
	target-lexicon@0.12.16
	unicode-ident@1.0.14
	unindent@0.2.3
	vcpkg@0.2.15
"

inherit cargo distutils-r1 flag-o-matic multiprocessing pypi

VEC_P=cryptography_vectors-$(ver_cut 1-3)
DESCRIPTION="cryptography is a package which provides cryptographic recipes and primitives to Python developers."
HOMEPAGE="
  https://pypi.org/project/cryptography/
  homepage, https://github.com/pyca/cryptography
  documentation, https://cryptography.io/
  source, https://github.com/pyca/cryptography/
  issues, https://github.com/pyca/cryptography/issues
  changelog, https://cryptography.io/en/latest/changelog/
"
SRC_URI+="
	${CARGO_CRATE_URIS}
	test? (
		$(pypi_sdist_url cryptography_vectors "$(ver_cut 1-3)")
	)
"

LICENSE="|| ( Apache-2.0 BSD ) PSF-2"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-3.0
"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs docstest nox pep8test sdist ssh test test-randomorder"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	bcrypt>=3.1.5; extra == 'ssh'
	build>=1.0.0; extra == 'sdist'
	certifi>=2024; extra == 'test'
	cffi>=1.12; platform_python_implementation != 'PyPy'
	check-sdist; python_version >= '3.8' and extra == 'pep8test'
	click>=8.0.1; extra == 'pep8test'
	cryptography-vectors==44.0.0; extra == 'test'
	mypy>=1.4; extra == 'pep8test'
	nox>=2024.4.15; extra == 'nox'
	nox[uv]>=2024.3.2; python_version >= '3.8' and extra == 'nox'
	pretend>=0.7; extra == 'test'
	pyenchant>=3; extra == 'docstest'
	pytest-benchmark>=4.0; extra == 'test'
	pytest-cov>=2.10.1; extra == 'test'
	pytest-randomly; extra == 'test-randomorder'
	pytest-xdist>=3.5.0; extra == 'test'
	pytest>=7.4.0; extra == 'test'
	readme-renderer>=30.0; extra == 'docstest'
	ruff>=0.3.6; extra == 'pep8test'
	sphinx-rtd-theme>=3.0.0; python_version >= '3.8' and extra == 'docs'
	sphinx>=5.3.0; extra == 'docs'
	sphinxcontrib-spelling>=7.3.1; extra == 'docstest'
"
GENERATED_RDEPEND="${RDEPEND}
	ssh? ( >=dev-python/bcrypt-3.1.5[${PYTHON_USEDEP}] )
	sdist? ( >=dev-python/build-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/cffi-1.12[${PYTHON_USEDEP}]
	pep8test? ( dev-python/check-sdist[${PYTHON_USEDEP}] )
	pep8test? ( >=dev-python/click-8.0.1[${PYTHON_USEDEP}] )
	pep8test? ( >=dev-python/mypy-1.4[${PYTHON_USEDEP}] )
	nox? ( >=dev-python/nox-2024.3.2[uv,${PYTHON_USEDEP}] )
	nox? ( >=dev-python/nox-2024.4.15[${PYTHON_USEDEP}] )
	docstest? ( >=dev-python/pyenchant-3[${PYTHON_USEDEP}] )
	test-randomorder? ( dev-python/pytest-randomly[${PYTHON_USEDEP}] )
	docstest? ( >=dev-python/readme-renderer-30.0[${PYTHON_USEDEP}] )
	pep8test? ( >=dev-python/ruff-0.3.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.3.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-3.0.0[${PYTHON_USEDEP}] )
	docstest? ( >=dev-python/sphinxcontrib-spelling-7.3.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-libs/openssl-1.0.2o-r6:0=
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.8:=[${PYTHON_USEDEP}]
	' 'python*')
"
DEPEND="
	${RDEPEND}
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/certifi-2024[${PYTHON_USEDEP}]
		~dev-python/cryptography-vectors-44.0.0[${PYTHON_USEDEP}]
		>=dev-python/pretend-0.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.5.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	${RUST_DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/certifi[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-1.11.4[${PYTHON_USEDEP}]
		dev-python/iso8601[${PYTHON_USEDEP}]
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pyasn1-modules[${PYTHON_USEDEP}]
		dev-python/pytest-subtests[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

# Files built without CFLAGS/LDFLAGS, acceptable for rust
QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/cryptography/hazmat/bindings/_rust.*.so"

distutils_enable_tests pytest

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default

	sed -i -e 's:--benchmark-disable::' pyproject.toml || die

	# work around availability macros not supported in GCC (yet)
	if [[ ${CHOST} == *-darwin* ]] ; then
		local darwinok=0
		if [[ ${CHOST##*-darwin} -ge 16 ]] ; then
			darwinok=1
		fi
		sed -i -e 's/__builtin_available(macOS 10\.12, \*)/'"${darwinok}"'/' \
			src/_cffi_src/openssl/src/osrandom_engine.c || die
	fi
}

python_configure_all() {
	filter-lto # bug #903908

	export UNSAFE_PYO3_SKIP_VERSION_CHECK=1
}

python_test() {
	local -x PYTHONPATH="${PYTHONPATH}:${WORKDIR}/cryptography_vectors-${PV}"
	local EPYTEST_IGNORE=(
		tests/bench
	)
	epytest -n "$(makeopts_jobs)"
}
