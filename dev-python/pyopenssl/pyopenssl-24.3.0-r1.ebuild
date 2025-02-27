# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 toolchain-funcs pypi

DESCRIPTION="Python wrapper module around the OpenSSL library"
HOMEPAGE="
  https://pypi.org/project/pyopenssl/
  Source, https://github.com/pyca/pyopenssl
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cryptography<45,>=41.0.5
	pretend; extra == 'test'
	pytest-rerunfailures; extra == 'test'
	pytest>=3.0.1; extra == 'test'
	sphinx!=5.2.0,!=5.2.0.post0,!=7.2.5; extra == 'docs'
	sphinx_rtd_theme; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-41.0.5[${PYTHON_USEDEP}] <dev-python/cryptography-45[${PYTHON_USEDEP}]
	docs? ( !~dev-python/sphinx-5.2.0[${PYTHON_USEDEP}] !~dev-python/sphinx-5.2.0_p0[${PYTHON_USEDEP}] !~dev-python/sphinx-7.2.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/cryptography-45[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.5[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.9[${PYTHON_USEDEP}]
	' 3.{10..12})
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.0.1[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		$(python_gen_cond_dep '
			dev-python/cffi[${PYTHON_USEDEP}]
		' 'python*')
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

src_test() {
	local -x TZ=UTC
	local EPYTEST_DESELECT=(
		tests/test_ssl.py::TestContext::test_set_default_verify_paths
	)

	if ! tc-has-64bit-time_t; then
		einfo "time_t is smaller than 64 bits, will skip broken tests"
		EPYTEST_DESELECT+=(
			tests/test_crypto.py::TestX509StoreContext::test_verify_with_time
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	distutils-r1_src_test
}

python_test() {
	epytest -p rerunfailures
}
