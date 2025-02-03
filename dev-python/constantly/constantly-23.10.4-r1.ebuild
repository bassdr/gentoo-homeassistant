# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE="test"

inherit distutils-r1

DESCRIPTION="Symbolic constants in Python"
HOMEPAGE="
  https://pypi.org/project/constantly/
  Homepage, https://github.com/twisted/constantly
"
SRC_URI="
	https://github.com/twisted/constantly/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest
BDEPEND="${BDEPEND}
	dev-python/versioneer[${PYTHON_USEDEP}]
	test? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
