# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="CBOR (de)serializer with extensive tag support"
HOMEPAGE="
  https://pypi.org/project/cbor2/
  Changelog, https://cbor2.readthedocs.io/en/latest/versionhistory.html
  Documentation, https://cbor2.readthedocs.org/en/latest/
  Source Code, https://github.com/agronholm/cbor2
  Issue Tracker, https://github.com/agronholm/cbor2/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="benchmarks doc test"
IUSE="${GENERATED_IUSE} +native-extensions"

REQUIRES_DIST="
	Sphinx>=7; extra == 'doc'
	coverage>=7; extra == 'test'
	hypothesis; extra == 'test'
	packaging; extra == 'doc'
	pytest-benchmark==4.0.0; extra == 'benchmarks'
	pytest; extra == 'test'
	sphinx-autodoc-typehints>=1.2.0; extra == 'doc'
	sphinx-rtd-theme>=1.3.0; extra == 'doc'
	typing-extensions; python_version < '3.12' and extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/packaging[${PYTHON_USEDEP}] )
	benchmarks? ( ~dev-python/pytest-benchmark-4.0.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-autodoc-typehints-1.2.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	>=dev-python/setuptools-61[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-6.4[${PYTHON_USEDEP}]
"

python_prepare_all() {
	# remove pytest-cov dep
	sed -i -e "s/--cov//" pyproject.toml || die
	distutils-r1_python_prepare_all
}

python_compile() {
	local -x CBOR2_BUILD_C_EXTENSION=1
	# pypy3 not supported upstream
	if [[ ${EPYTHON} == pypy3 ]] || ! use native-extensions; then
		CBOR2_BUILD_C_EXTENSION=0
	fi
	distutils-r1_python_compile
}
