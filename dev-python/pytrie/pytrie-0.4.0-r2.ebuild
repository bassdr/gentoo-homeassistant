# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyTrie"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytrie/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/test[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
