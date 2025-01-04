# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
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
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]"

distutils_enable_tests pytest