# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Extension to include jQuery on newer Sphinx releases"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-jquery/
  Repository, https://github.com/sphinx-contrib/jquery/
"

# MIT for jQuery
LICENSE="0BSD MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"

PATCHES=( "${FILESDIR}/${PN}-4.1-backport-pr28.patch" )

distutils_enable_tests pytest
