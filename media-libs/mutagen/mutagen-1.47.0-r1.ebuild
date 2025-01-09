# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="read and write audio tags for many formats"
HOMEPAGE="
  https://pypi.org/project/mutagen/
"
SRC_URI="
	https://github.com/quodlibet/mutagen/releases/download/release-${PV}/${P}.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/eyed3[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		media-libs/flac[ogg]
	)
"

DOCS=( NEWS README.rst )

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme
