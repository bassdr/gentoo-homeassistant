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

GENERATED_DEPEND="
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
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

src_prepare() {
	# oldschool namespaces
	rm keyrings/__init__.py || die
	distutils-r1_src_prepare
}

python_test() {
	epytest -k 'not Cryptodome'
}
