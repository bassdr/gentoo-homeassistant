# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CARGO_OPTIONAL=1
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

CRATES="
	autocfg@1.4.0
	cfg-if@1.0.0
	heck@0.5.0
	indoc@2.0.5
	libc@0.2.164
	memchr@2.7.4
	memoffset@0.9.1
	once_cell@1.20.2
	portable-atomic@1.9.0
	proc-macro2@1.0.89
	pyo3-build-config@0.23.3
	pyo3-ffi@0.23.3
	pyo3-macros-backend@0.23.3
	pyo3-macros@0.23.3
	pyo3@0.23.3
	quote@1.0.37
	syn@2.0.87
	target-lexicon@0.12.16
	unicode-ident@1.0.13
	unindent@0.2.3
"

inherit cargo distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dulwich/"
SRC_URI+="
	native-extensions? (
		${CARGO_CRATE_URIS}
	)
"

LICENSE="GPL-2+ Apache-2.0"
LICENSE+=" native-extensions? ("
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT Unicode-DFS-2016"
LICENSE+=" )"

SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="fastimport https paramiko pgp test"
IUSE="${GENERATED_IUSE} doc examples +native-extensions test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	fastimport; extra == 'fastimport'
	gpg; extra == 'pgp'
	mypy==1.13.0; extra == 'dev'
	paramiko; extra == 'paramiko'
	ruff==0.8.3; extra == 'dev'
	urllib3>=1.24.1; extra == 'https'
	urllib3>=1.25
"
GENERATED_RDEPEND="${RDEPEND}
	fastimport? ( dev-python/fastimport[${PYTHON_USEDEP}] )
	pgp? ( dev-python/gpg[${PYTHON_USEDEP}] )
	paramiko? ( dev-python/paramiko[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.25[${PYTHON_USEDEP}]
	https? ( >=dev-python/urllib3-1.24.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/urllib3-1.25[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
		~dev-python/ruff-0.8.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	native-extensions? (
		${RUST_DEPEND}
		dev-python/setuptools-rust[${PYTHON_USEDEP}]
	)
	test? (
		${RDEPEND}
		app-crypt/gpgme[python,${PYTHON_USEDEP}]
		dev-python/fastimport[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs

QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/dulwich/_.*.so"

pkg_setup() {
	# avoid rust_pkg_setup which will die when there's no Rust found
	if use native-extensions ; then
		rust_pkg_setup  # implicitly inherited through cargo
	fi
}

src_unpack() {
	cargo_src_unpack
}

python_compile() {
	unset PURE
	# TODO: enable Rust extensions
	if ! use native-extensions; then
		local -x PURE=1
	fi

	distutils-r1_python_compile
}

python_test() {
	# remove interference from the tests that do stuff like user.name
	unset GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_AUTHOR_DATE
	unset GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE
	unset EMAIL
	# Do not use make check which rebuilds the extension and uses -Werror,
	# causing unexpected failures.
	"${EPYTHON}" -m unittest -v tests.test_suite ||
		die "tests failed with ${EPYTHON}"
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}
