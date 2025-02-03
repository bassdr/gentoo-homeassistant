# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 flag-o-matic

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/psycopg/"
SRC_URI="
	https://github.com/psycopg/psycopg/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs pool"
IUSE="${GENERATED_IUSE} +native-extensions"

DEPEND="
	native-extensions? (
		>=dev-db/postgresql-8.1:=
	)
	!native-extensions? (
		>=dev-db/postgresql-8.1:*
	)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/backports-zoneinfo-0.2.0[${PYTHON_USEDEP}]
	docs? ( =dev-python/furo-2022.6.21[${PYTHON_USEDEP}] )
	pool? ( dev-python/psycopg-pool[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-1.12[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	>=dev-python/typing-extensions-4.4[${PYTHON_USEDEP}]
"
BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/tomli[${PYTHON_USEDEP}]
		' 3.10)
	)
	test? (
		>=dev-db/postgresql-8.1[server]
		>=dev-python/anyio-4.0[${PYTHON_USEDEP}]
		>=dev-python/dnspython-2.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/anyio-4.0[${PYTHON_USEDEP}]
		>=dev-python/ast-comments-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/black-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/codespell-2.2[${PYTHON_USEDEP}]
		>=dev-python/dnspython-2.1[${PYTHON_USEDEP}]
		>=dev-python/flake8-4.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.14[${PYTHON_USEDEP}]
		>=dev-python/pproxy-2.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-randomly-3.5[${PYTHON_USEDEP}]
		>=dev-python/types-setuptools-57.4[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.37[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_compile() {
	# -Werror=strict-aliasing
	# https://bugs.gentoo.org/935401
	# https://github.com/psycopg/psycopg/issues/867
	#
	# Do not trust with LTO either.
	append-flags -fno-strict-aliasing
	filter-lto

	# Python code + ctypes backend
	cd psycopg || die
	distutils-r1_python_compile

	# optional C backend
	if use native-extensions && [[ ${EPYTHON} != pypy3 ]]; then
		local DISTUTILS_USE_PEP517=standalone
		cd ../psycopg_c || die
		distutils-r1_python_compile
	fi
	cd .. || die
}

src_test() {
	rm -r psycopg{,_c} || die

	initdb -D "${T}"/pgsql || die
	# TODO: random port
	pg_ctl -w -D "${T}"/pgsql start \
		-o "-h '' -k '${T}'" || die
	createdb -h "${T}" test || die

	local -x PSYCOPG_TEST_DSN="host=${T} dbname=test"
	distutils-r1_src_test

	pg_ctl -w -D "${T}"/pgsql stop || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# tests for the psycopg_pool package
		tests/pool
		# some broken mypy magic
		tests/test_module.py::test_version
		tests/test_module.py::test_version_c
		tests/test_typing.py
		tests/crdb/test_typing.py
		# TODO, relying on undefined ordering in Python?
		tests/test_dns_srv.py::test_srv
	)

	local impls=( python )
	if use native-extensions && [[ ${EPYTHON} != pypy3 ]]; then
		impls+=( c )
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PSYCOPG_IMPL
	for PSYCOPG_IMPL in "${impls[@]}"; do
		einfo "Testing with ${PSYCOPG_IMPL} implementation ..."
		# leak and timing tests are fragile whereas slow tests are slow
		epytest -p anyio -k "not leak" \
			-m "not timing and not slow and not flakey"
	done
}
