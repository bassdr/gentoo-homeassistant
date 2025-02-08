# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 4.6.2.post1)"
S="${WORKDIR}/${PN}-4.6.2.post1"

DESCRIPTION="High level compatibility layer for multiple asynchronous event loop implementations"
HOMEPAGE="
  https://pypi.org/project/anyio/
  Documentation, https://anyio.readthedocs.io/en/latest/
  Changelog, https://anyio.readthedocs.io/en/stable/versionhistory.html
  Source code, https://github.com/agronholm/anyio
  Issue tracker, https://github.com/agronholm/anyio/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc trio"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx~=7.4; extra == "doc"
	anyio[trio]; extra == "test"
	coverage[toml]>=7; extra == "test"
	exceptiongroup>=1.0.2; python_version < "3.11"
	exceptiongroup>=1.2.0; extra == "test"
	hypothesis>=4.0; extra == "test"
	idna>=2.8
	packaging; extra == "doc"
	psutil>=5.9; extra == "test"
	pytest-mock>=3.6.1; extra == "test"
	pytest>=7.0; extra == "test"
	sniffio>=1.1
	sphinx-autodoc-typehints>=1.2.0; extra == "doc"
	sphinx-rtd-theme; extra == "doc"
	trio>=0.26.1; extra == "trio"
	trustme; extra == "test"
	truststore>=0.9.1; python_version >= "3.10" and extra == "test"
	typing-extensions>=4.1; python_version < "3.11"
	uvloop>=0.21.0b1; (platform_python_implementation == "CPython" and platform_system != "Windows") and extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	doc? ( dev-python/packaging[${PYTHON_USEDEP}] )
	>=dev-python/sniffio-1.1[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-7.4[${PYTHON_USEDEP}] =dev-python/sphinx-7*[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-autodoc-typehints-1.2.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.26.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.1[${PYTHON_USEDEP}]
	>=dev-python/truststore-0.9.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/exceptiongroup-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
	' 3.10)
"
# On amd64, let's get more test coverage by dragging in uvloop, but let's
# not bother on other arches where uvloop may not be supported.
BDEPEND="
	>=dev-python/setuptools-scm-6.4[${PYTHON_USEDEP}]
	test? (
		>=dev-python/exceptiongroup-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-4.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			>=dev-python/trio-0.26.1[${PYTHON_USEDEP}]
		' 3.{10..13})
		amd64? (
			$(python_gen_cond_dep '
				>=dev-python/uvloop-0.21.0_beta1[${PYTHON_USEDEP}]
			' python3_{10..13})
		)
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/anyio[trio,${PYTHON_USEDEP}]
		>=dev-python/coverage-7[toml,${PYTHON_USEDEP}]
		>=dev-python/exceptiongroup-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-4.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		>=dev-python/truststore-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.21.0_beta1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
distutils_enable_sphinx docs \
	'>=dev-python/sphinx-rtd-theme-1.2.2' \
	dev-python/sphinxcontrib-jquery \
	dev-python/sphinx-autodoc-typehints

python_test() {
	local EPYTEST_DESELECT=(
		# requires link-local IPv6 interface
		tests/test_sockets.py::TestTCPListener::test_bind_link_local
	)

	local filter=()
	if ! has_version ">=dev-python/trio-0.26.1[${PYTHON_USEDEP}]"; then
		filter+=( -k "not trio" )
		EPYTEST_DESELECT+=(
			tests/test_pytest_plugin.py::test_plugin
			tests/test_pytest_plugin.py::test_autouse_async_fixture
			tests/test_pytest_plugin.py::test_cancel_scope_in_asyncgen_fixture
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -m 'not network' "${filter[@]}"
}
