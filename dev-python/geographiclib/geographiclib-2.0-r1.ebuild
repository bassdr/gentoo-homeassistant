# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="The geodesic routines from GeographicLib"
HOMEPAGE="
  https://pypi.org/project/geographiclib/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND+=" !sci-geosciences/GeographicLib"

distutils_enable_tests unittest
