# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Read one-dimensional barcodes and QR codes from Python 2 and 3."
HOMEPAGE="
  https://pypi.org/project/pyzbar/
"
SRC_URI="https://github.com/NaturalHistoryMuseum/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="scripts"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Pillow (>=3.2.0); extra == 'scripts'
	enum34 (>=1.1.6); python_version=='2.7'
	pathlib (>=1.0.1); python_version=='2.7'
"
GENERATED_RDEPEND="${RDEPEND}
	scripts? ( >=dev-python/pillow-3.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
	media-gfx/zbar
"

BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
