# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Typed Python package for the nVent RAYCHEM SENZ RestAPI"
HOMEPAGE="
  https://pypi.org/project/aiosenz/
  Say Thanks!, https://saythanks.io/to/milan.meulemans@live.be
  Bug Tracker, https://github.com/milanmeu/aiosenz/issues
  Source Code, https://github.com/milanmeu/aiosenz
  Documentation, https://github.com/milanmeu/aiosenz/blob/main/README.md
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	authlib
	httpx
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/authlib[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
