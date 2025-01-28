# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="This package provides 29 stemmers for 28 languages generated from Snowball algorithms."
HOMEPAGE="
  https://pypi.org/project/snowballstemmer/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
