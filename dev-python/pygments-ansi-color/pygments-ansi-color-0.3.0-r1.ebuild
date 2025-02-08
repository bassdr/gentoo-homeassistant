# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygments-ansi-color/"
# No tests in PyPI tarballs
SRC_URI="
	https://github.com/chriskuehl/pygments-ansi-color/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pygments (!=2.7.3)
"
GENERATED_RDEPEND="${RDEPEND}
	!~dev-python/pygments-2.7.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pygments[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
