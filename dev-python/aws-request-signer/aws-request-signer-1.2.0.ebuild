# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A python library to sign AWS requests using AWS Signature V4."
HOMEPAGE="
  https://pypi.org/project/aws-request-signer/
  Repository, https://www.github.com/iksteen/aws-request-signer.git
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="demo requests"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	requests (>=2.21,<3.0) ; extra == 'requests' or extra == 'demo'
	requests_toolbelt (>=0.8.0,<0.9.0) ; extra == 'demo'
"
GENERATED_RDEPEND="${RDEPEND}
	requests? ( >=dev-python/requests-2.21[${PYTHON_USEDEP}] <dev-python/requests-3.0[${PYTHON_USEDEP}] ) demo? ( >=dev-python/requests-2.21[${PYTHON_USEDEP}] <dev-python/requests-3.0[${PYTHON_USEDEP}] )
	demo? ( >=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}] <dev-python/requests-toolbelt-0.9.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
