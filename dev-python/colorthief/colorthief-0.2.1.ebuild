# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A module for grabbing the color palette from an image."
HOMEPAGE="
  https://pypi.org/project/colorthief/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	Pillow
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
