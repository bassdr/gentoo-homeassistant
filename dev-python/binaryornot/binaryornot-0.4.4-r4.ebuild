# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/binaryornot/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst HISTORY.rst CONTRIBUTING.rst )

PATCHES=(
	# https://github.com/audreyr/binaryornot/commit/38dee57986c6679d9936a1da6f6c8182da3734f8
	"${FILESDIR}"/${P}-tests.patch
)

distutils_enable_tests unittest
distutils_enable_sphinx docs
