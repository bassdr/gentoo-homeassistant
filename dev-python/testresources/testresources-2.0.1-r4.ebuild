# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/testresources/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		dev-python/testtools[${PYTHON_USEDEP}]
		dev-python/fixtures[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${P}-py312-tests.patch"
)

distutils_enable_tests unittest
