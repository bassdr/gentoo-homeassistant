# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="pysmb is an experimental SMB/CIFS library written in Python to support file sharing between Windows and Linux machines"
HOMEPAGE="
  https://pypi.org/project/pysmb/
"
SRC_URI="https://github.com/miketeo/${PN}/archive/refs/tags/${P}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest