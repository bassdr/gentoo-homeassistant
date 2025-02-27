# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Simple wrapper client for the Vilfo router API"
HOMEPAGE="
  https://pypi.org/project/vilfo-api-client/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	getmac
	requests
	responses; extra == 'dev'
	responses; extra == 'test'
	semver
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/getmac[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/semver[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/semver[${PYTHON_USEDEP}]
	dev-python/getmac[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/responses[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
