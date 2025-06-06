# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A mocking library for requests."
HOMEPAGE="
  https://pypi.org/project/httmock/
"
SRC_URI="
	https://github.com/patrys/httmock/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	requests (>=1.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
