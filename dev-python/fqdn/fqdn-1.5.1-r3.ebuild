# Copyright 2018-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Validates fully-qualified domain names against RFC 1123, so that they are acceptable to modern bowsers"
HOMEPAGE="
  https://pypi.org/project/fqdn/
"
SRC_URI="
	https://github.com/ypcrts/fqdn/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
distutils_enable_sphinx docs
