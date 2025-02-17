# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="JOSE protocol implementation in Python"
HOMEPAGE="
  https://pypi.org/project/josepy/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cryptography (>=1.5)
	pyopenssl (>=0.13)
	sphinx (>=4.3.0) ; extra == 'docs'
	sphinx-rtd-theme (>=1.0) ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-1.5[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.13[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-4.3.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/cryptography-1.5[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.13[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# I haven't seen a single switch to poetry without major bugs yet...
	sed -i -e 's:^include:exclude:' pyproject.toml || die

	distutils-r1_src_prepare
}
