# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/radon/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="toml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	colorama (==0.4.1) ; python_version <= '3.4'
	colorama (>=0.4.1) ; python_version > '3.4'
	mando (<0.8,>=0.6)
	tomli (>=2.0.1) ; extra == 'toml'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/colorama-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/mando-0.6[${PYTHON_USEDEP}] <dev-python/mando-0.8[${PYTHON_USEDEP}]
	toml? ( >=dev-python/tomli-2.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/colorama-0.4.1[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	>=dev-python/mando-0.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# unpin deps
	sed -i -e 's:,<[0-9.]*::' pyproject.toml || die
}
