# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Pure-Python HPACK header compression"
HOMEPAGE="
  https://pypi.org/project/hpack/
"
# PyPI sdist is missing test fixtures, as of 4.0.0
SRC_URI="
	https://github.com/python-hyper/hpack/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# dev-python/pytest-relaxed causes tests to fail
BDEPEND="
	test? (
		>=dev-python/hypothesis-3.4.2[${PYTHON_USEDEP}]
		!!dev-python/pytest-relaxed[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
