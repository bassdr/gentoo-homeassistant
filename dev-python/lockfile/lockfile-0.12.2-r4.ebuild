# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Platform-independent file locking module"
HOMEPAGE="
  https://pypi.org/project/lockfile/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	>dev-python/pbr-1.8[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/${P}-pytest.patch
)

distutils_enable_tests pytest
distutils_enable_sphinx doc/source --no-autodoc
