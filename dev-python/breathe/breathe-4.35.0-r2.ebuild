# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/breathe/"
SRC_URI="
	https://github.com/breathe-doc/breathe/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.12[${PYTHON_USEDEP}]
	!=dev-python/sphinx-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	app-text/doxygen
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}]
	dev-texlive/texlive-bibtexextra
	dev-texlive/texlive-fontsextra
	dev-texlive/texlive-fontutils
	dev-texlive/texlive-latex
	dev-texlive/texlive-latexextra
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/breathe-doc/breathe/pull/956
	"${FILESDIR}/${P}-sphinx-7.2.patch"
)
