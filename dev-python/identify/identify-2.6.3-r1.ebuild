# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="File identification library for Python"
HOMEPAGE="
  https://pypi.org/project/identify/
"
SRC_URI="
	https://github.com/pre-commit/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="license"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	ukkonen; extra == 'license'
"
GENERATED_RDEPEND="${RDEPEND}
	license? ( dev-python/ukkonen[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/ukkonen[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
