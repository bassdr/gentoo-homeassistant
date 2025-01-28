# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/widgetsnbextension/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/jupyter-packaging[${PYTHON_USEDEP}]
"

src_install() {
	distutils-r1_src_install

	mv "${ED}/usr/etc" "${ED}/etc" || die
}
