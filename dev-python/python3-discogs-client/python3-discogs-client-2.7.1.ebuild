# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
KEYWORDS="amd64 arm64 ~x86"

DESCRIPTION="Continuation of the official Python API client for Discogs"
HOMEPAGE="
	https://github.com/joalla/discogs_client/
	https://pypi.org/project/python3-discogs-client/
"

LICENSE="BSD-2"
SLOT="0"

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
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]"

distutils_enable_tests unittest
