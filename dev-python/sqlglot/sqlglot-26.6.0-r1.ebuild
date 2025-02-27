# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

CARGO_OPTIONAL=1
CRATES="
	aho-corasick@1.1.3
	anes@0.1.6
	anstyle@1.0.10
	autocfg@1.1.0
	bumpalo@3.16.0
	cast@0.3.0
	cfg-if@1.0.0
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.23
	clap_builder@4.5.23
	clap_lex@0.7.4
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.2
	either@1.13.0
	half@2.4.1
	heck@0.5.0
	hermit-abi@0.4.0
	indoc@2.0.4
	is-terminal@0.4.13
	itertools@0.10.5
	itoa@1.0.14
	js-sys@0.3.76
	libc@0.2.169
	log@0.4.22
	memchr@2.7.4
	memoffset@0.9.0
	num-traits@0.2.19
	once_cell@1.19.0
	oorandom@11.1.4
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	portable-atomic@1.9.0
	proc-macro2@1.0.89
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	quote@1.0.37
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rustc-hash@2.1.0
	ryu@1.0.18
	same-file@1.0.6
	serde@1.0.216
	serde_derive@1.0.216
	serde_json@1.0.133
	syn@2.0.87
	target-lexicon@0.12.16
	tinytemplate@1.2.1
	unicode-ident@1.0.12
	unindent@0.2.3
	walkdir@2.5.0
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-shared@0.2.99
	wasm-bindgen@0.2.99
	web-sys@0.3.76
	winapi-util@0.1.9
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
"

inherit cargo distutils-r1 pypi optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sqlglot/"
SRC_URI+="
	native-extensions? (
		${CARGO_CRATE_URIS}
	)
"

LICENSE="MIT"
LICENSE+=" native-extensions? ("
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions MIT Unicode-DFS-2016
"
LICENSE+=" )"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="rs test"
IUSE="${GENERATED_IUSE} +native-extensions"

REQUIRES_DIST="
	duckdb>=0.6; extra == 'dev'
	maturin<2.0,>=1.4; extra == 'dev'
	mypy; extra == 'dev'
	pandas-stubs; extra == 'dev'
	pandas; extra == 'dev'
	pdoc; extra == 'dev'
	pre-commit; extra == 'dev'
	python-dateutil; extra == 'dev'
	pytz; extra == 'dev'
	ruff==0.7.2; extra == 'dev'
	sqlglotrs==0.3.14; extra == 'rs'
	types-python-dateutil; extra == 'dev'
	types-pytz; extra == 'dev'
	typing-extensions; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	rs? ( ~dev-python/sqlglotrs-0.3.14[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

BDEPEND+="
	native-extensions? (
		${RUST_DEPEND}
		dev-util/maturin[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/duckdb-0.6[${PYTHON_USEDEP}]
		>=dev-python/maturin-1.4[${PYTHON_USEDEP}] <dev-python/maturin-2.0[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pandas-stubs[${PYTHON_USEDEP}]
		dev-python/pdoc[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		~dev-python/ruff-0.7.2[${PYTHON_USEDEP}]
		dev-python/types-python-dateutil[${PYTHON_USEDEP}]
		dev-python/types-pytz[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/sqlglotrs/sqlglotrs.*.so"

pkg_setup() {
	use native-extensions && rust_pkg_setup
}

src_unpack() {
	cargo_src_unpack
}

python_compile() {
	distutils-r1_python_compile

	if use native-extensions; then
		local DISTUTILS_USE_PEP517=maturin
		cd sqlglotrs || die
		distutils-r1_python_compile
		cd - >/dev/null || die
	fi
}

python_test() {
	local EPYTEST_DESELECT=(
		# timing, sigh
		# https://github.com/tobymao/sqlglot/issues/3961
		tests/test_generator.py::TestGenerator::test_generate_nested_binary
	)
	local EPYTEST_IGNORE=(
		# Tests require pyspark or duckdb which aren't in the tree.
		# Pandas would be a requirement normally, but it gets ignored by proxy.
		"tests/dataframe/integration/test_dataframe.py"
		"tests/dataframe/integration/test_grouped_data.py"
		"tests/dataframe/integration/test_session.py"
		"tests/test_executor.py"
		"tests/test_optimizer.py"
	)

	# make sure not to use an earlier installed version
	local -x SQLGLOTRS_TOKENIZER=$(usex native-extensions 1 0)
	rm -rf sqlglotrs || die
	epytest
}

pkg_postinst() {
	optfeature "simplifying timedelta expressions" dev-python/python-dateutil
}
