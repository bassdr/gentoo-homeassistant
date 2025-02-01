# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mistletoe/"
# pypi has incomplete test suite
SRC_URI="
	https://github.com/miyuchina/mistletoe/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# NB: pygments is technically optional but we like syntax highlighting
RDEPEND="
	dev-python/pygments[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/parameterized[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
