# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Converts a Python dictionary or other native data type into a valid XML string."
HOMEPAGE="
  https://pypi.org/project/dicttoxml/
  Homepage, https://github.com/quandyfactory/dicttoxml
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest
