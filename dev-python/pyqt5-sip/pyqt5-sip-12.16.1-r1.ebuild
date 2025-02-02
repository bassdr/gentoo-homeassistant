# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
# keep compat in sync with pyqt5 or else it confuses some revdeps
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/PyQt5-sip/"

LICENSE="BSD-2"
SLOT="0/$(ver_cut 1)"
KEYWORDS="amd64 arm64"
