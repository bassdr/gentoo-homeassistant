# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12,13{,t}} )

CRATES="
	archery@1.2.1
	autocfg@1.3.0
	cc@1.0.90
	cfg-if@1.0.0
	heck@0.5.0
	indoc@2.0.5
	libc@0.2.155
	memoffset@0.9.1
	once_cell@1.19.0
	portable-atomic@1.6.0
	proc-macro2@1.0.86
	pyo3-build-config@0.23.3
	pyo3-ffi@0.23.3
	pyo3-macros-backend@0.23.3
	pyo3-macros@0.23.3
	pyo3@0.23.3
	python3-dll-a@0.2.11
	quote@1.0.36
	rpds@1.1.0
	syn@2.0.69
	target-lexicon@0.12.14
	triomphe@0.1.13
	unicode-ident@1.0.12
	unindent@0.2.3
"

RUST_MIN_VER="1.77.1"

inherit cargo distutils-r1 pypi

DESCRIPTION="Python bindings to Rust's persistent data structures (rpds)"
HOMEPAGE="
  https://pypi.org/project/rpds-py/
  Documentation, https://rpds.readthedocs.io/
  Homepage, https://github.com/crate-py/rpds
  Issues, https://github.com/crate-py/rpds/issues/
  Funding, https://github.com/sponsors/Julian
  Tidelift, https://tidelift.com/subscription/pkg/pypi-rpds-py?utm_source=pypi-rpds-py&utm_medium=referral&utm_campaign=pypi-link
  Source, https://github.com/crate-py/rpds
  Upstream, https://github.com/orium/rpds
"
SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="amd64 arm64"

QA_FLAGS_IGNORED="usr/lib.*/py.*/site-packages/rpds/rpds.*.so"

distutils_enable_tests pytest

export UNSAFE_PYO3_SKIP_VERSION_CHECK=1