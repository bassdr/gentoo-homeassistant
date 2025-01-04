# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="A dot-accessible dictionary (a la JavaScript objects)"
HOMEPAGE="
  https://pypi.org/project/munch/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/Infinidat/munch/pull/104
	"${FILESDIR}/${P}-py313.patch"
)