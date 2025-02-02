# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/uvloop/"
SRC_URI+=" https://dev.gentoo.org/~sam/distfiles/${CATEGORY}/${PN}/${PN}-0.19.0-cython3.patch.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="${RDEPEND}
	docs? ( ~dev-python/sphinx-4.1.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-0.5.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-asyncio-0.3.0[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-libs/libuv-1.11.0:=
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
"
BDEPEND="
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]
		>=dev-python/pyopenssl-22.0.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]
	~dev-python/cython-3.0[${PYTHON_USEDEP}]
	~dev-python/flake8-5.0[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	~dev-python/pycodestyle-2.9.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-60[${PYTHON_USEDEP}]
)"

python_prepare_all() {
	rm -r vendor || die
	cat <<-EOF >> setup.cfg || die
		[build_ext]
		use_system_libuv=True
		cython_always=True
	EOF

	# force cythonization
	rm uvloop/loop.c || die

	distutils-r1_python_prepare_all

	# don't append -O2...  however, it's not splitting args correctly,
	# so let's pass something safe
	export UVLOOP_OPT_CFLAGS=-Wall
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local EPYTEST_IGNORE=(
		# linting
		tests/test_sourcecode.py
	)
	local EPYTEST_DESELECT=(
		# unhappy about sandbox injecting its envvars
		tests/test_process.py::Test_UV_Process::test_process_env_2
		tests/test_process.py::Test_AIO_Process::test_process_env_2
		# crashes on assertion
		# https://github.com/MagicStack/uvloop/issues/574
		tests/test_cython.py::TestCythonIntegration::test_cython_coro_is_coroutine
		# Internet
		tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_{8,9}
	)

	rm -rf uvloop || die
	epytest -s
}

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
