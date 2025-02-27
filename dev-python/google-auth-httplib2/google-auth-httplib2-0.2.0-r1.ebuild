# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="google-auth-library-python-httplib2-${PV}"
DESCRIPTION="Google Authentication Library: httplib2 transport"
HOMEPAGE="
  https://pypi.org/project/google-auth-httplib2/
"
SRC_URI="
	https://github.com/googleapis/google-auth-library-python-httplib2/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	google-auth
	httplib2 >=0.19.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/google-auth[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httplib2[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
