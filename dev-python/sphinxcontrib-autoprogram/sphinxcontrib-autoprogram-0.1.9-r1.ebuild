# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-autoprogram/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx >=1.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/sphinx-1.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
