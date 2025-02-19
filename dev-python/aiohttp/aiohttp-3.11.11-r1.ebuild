# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Async http client/server framework (asyncio)"
HOMEPAGE="
  https://pypi.org/project/aiohttp/
  Chat: Matrix, https://matrix.to/#/#aio-libs:matrix.org
  Chat: Matrix Space, https://matrix.to/#/#aio-libs-space:matrix.org
  CI: GitHub Actions, https://github.com/aio-libs/aiohttp/actions?query=workflow%3ACI
  Coverage: codecov, https://codecov.io/github/aio-libs/aiohttp
  Docs: Changelog, https://docs.aiohttp.org/en/stable/changes.html
  Docs: RTD, https://docs.aiohttp.org
  GitHub: issues, https://github.com/aio-libs/aiohttp/issues
  GitHub: repo, https://github.com/aio-libs/aiohttp
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="speedups"
IUSE="${GENERATED_IUSE} +native-extensions +speedups test-rust"
REQUIRES_DIST="
	Brotli; platform_python_implementation == 'CPython' and extra == 'speedups'
	aiodns>=3.2.0; (sys_platform == 'linux' or sys_platform == 'darwin') and extra == 'speedups'
	aiohappyeyeballs>=2.3.0
	aiosignal>=1.1.2
	async-timeout<6.0,>=4.0; python_version < '3.11'
	attrs>=17.3.0
	brotlicffi; platform_python_implementation != 'CPython' and extra == 'speedups'
	frozenlist>=1.1.1
	multidict<7.0,>=4.5
	propcache>=0.2.0
	yarl<2.0,>=1.17.0
"
GENERATED_RDEPEND="${RDEPEND}
	speedups? ( app-arch/brotli[python,${PYTHON_USEDEP}] )
	speedups? ( >=dev-python/aiodns-3.2.0[${PYTHON_USEDEP}] )
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiosignal-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/attrs-17.3.0[${PYTHON_USEDEP}]
	>=dev-python/frozenlist-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5[${PYTHON_USEDEP}] <dev-python/multidict-7.0[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.17.0[${PYTHON_USEDEP}] <dev-python/yarl-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		www-servers/gunicorn[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/re-assert[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/time-machine[${PYTHON_USEDEP}]
		' 'python3*')
		test-rust? (
			dev-python/trustme[${PYTHON_USEDEP}]
		)
	)
"

DOCS=( CHANGES.rst CONTRIBUTORS.txt README.rst )

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_prepare() {
	# increase the timeout a little
	sed -e '/abs=/s/0.001/0.01/' -i tests/test_helpers.py || die
	# xfail_strict fails on py3.10
	sed -i -e '/--cov/d' -e '/pytest_cov/d' -e '/xfail_strict/d' setup.cfg || die
	sed -i -e 's:-Werror::' Makefile || die

	distutils-r1_src_prepare
}

python_configure() {
	if [[ ! -d tools && ${EPYTHON} != pypy3 ]] && use native-extensions
	then
		# workaround missing files
		mkdir tools || die
		> requirements/cython.txt || die
		> tools/gen.py || die
		chmod +x tools/gen.py || die
		# force rehashing first
		emake requirements/.hash/cython.txt.hash
		> .update-pip || die
		> .install-cython || die
		emake cythonize
	fi
}

python_compile() {
	# implicitly disabled for pypy3
	if ! use native-extensions; then
		local -x AIOHTTP_NO_EXTENSIONS=1
	fi

	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_IGNORE=(
		# proxy is not packaged
		tests/test_proxy_functional.py
		# python_on_whales is not packaged
		tests/autobahn/test_autobahn.py
		# benchmarks
		tests/test_benchmarks_client.py
		tests/test_benchmarks_client_request.py
		tests/test_benchmarks_client_ws.py
		tests/test_benchmarks_cookiejar.py
		tests/test_benchmarks_http_websocket.py
		tests/test_benchmarks_http_writer.py
		tests/test_benchmarks_web_fileresponse.py
		tests/test_benchmarks_web_middleware.py
		tests/test_benchmarks_web_response.py
		tests/test_benchmarks_web_urldispatcher.py
	)

	local EPYTEST_DESELECT=(
		# Internet
		tests/test_client_session.py::test_client_session_timeout_zero
		# broken by irrelevant deprecation warnings
		tests/test_circular_imports.py::test_no_warnings
	)

	# upstream unconditionally blocks building C extensions
	# on PyPy3 but the test suite needs an explicit switch
	if [[ ${EPYTHON} == pypy3 ]] || ! use native-extensions; then
		local -x AIOHTTP_NO_EXTENSIONS=1
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_mock,xdist.plugin
	rm -rf aiohttp || die
	epytest -m "not internal and not dev_mode" \
		-p rerunfailures --reruns=5
}
