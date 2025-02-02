# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
PYPI_PN="backports.ssl_match_hostname"
inherit pypi distutils-r1

MY_PN=${PN/-/.}
MY_PN=${MY_PN//-/_}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/backports.ssl-match-hostname/"
LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"

python_prepare_all() {
	sed -e 's:from distutils.core:from setuptools:' -i setup.py || die
	distutils-r1_python_prepare_all
}
