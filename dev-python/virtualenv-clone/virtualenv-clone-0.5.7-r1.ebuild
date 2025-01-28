# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/virtualenv-clone/"
SRC_URI="
	https://github.com/edwardgeorge/virtualenv-clone/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

PATCHES=( "${FILESDIR}/${PN}-0.5.7-backport-pr79.patch" )

distutils_enable_tests pytest
