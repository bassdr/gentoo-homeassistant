# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="keyrings.alt"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Alternate keyring implementations"
HOMEPAGE="
  https://pypi.org/project/keyrings.alt/
  Source, https://github.com/jaraco/keyrings.alt
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-3.4.1[${PYTHON_USEDEP}]
	test? (
		>=dev-python/keyring-20[${PYTHON_USEDEP}]
		dev-python/pycryptodome[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/keyring-20[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
	dev-python/pytest-mypy[${PYTHON_USEDEP}]
)"

src_prepare() {
	# oldschool namespaces
	rm keyrings/__init__.py || die
	distutils-r1_src_prepare
}

python_test() {
	epytest -k 'not Cryptodome'
}
