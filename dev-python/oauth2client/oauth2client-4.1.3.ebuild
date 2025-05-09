# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="OAuth 2.0 client library"
HOMEPAGE="
  https://pypi.org/project/oauth2client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httplib2 (>=0.9.1)
	pyasn1 (>=0.1.7)
	pyasn1-modules (>=0.0.5)
	rsa (>=3.1.4)
	six (>=1.6.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httplib2-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.0.5[${PYTHON_USEDEP}]
	>=dev-python/rsa-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httplib2-0.9.1[${PYTHON_USEDEP}]
	|| ( >=dev-python/pysnmp-pyasn1-0.1.7[${PYTHON_USEDEP}] dev-python/pyasn1[${PYTHON_USEDEP}] )
	|| ( >=dev-python/pysnmp-pyasn1-modules-0.0.5[${PYTHON_USEDEP}] dev-python/pyasn1-modules[${PYTHON_USEDEP}] )
	>=dev-python/rsa-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
