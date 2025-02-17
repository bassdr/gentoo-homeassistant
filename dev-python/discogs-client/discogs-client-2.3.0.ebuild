# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Official Python API client for Discogs"
HOMEPAGE="
  https://pypi.org/project/discogs-client/
"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	oauthlib
	requests
	six
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/oauthlib[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/python3-discogs-client"

distutils_enable_tests pytest
