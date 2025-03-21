# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PlexAPI"
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the Plex API."
HOMEPAGE="
  https://pypi.org/project/plexapi/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="alert"
IUSE="${GENERATED_IUSE}"

DOCS="README.rst"

REQUIRES_DIST="
	requests
	websocket-client>=1.3.3; extra == 'alert'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	alert? ( >=dev-python/websocket-client-1.3.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/PlexAPI"

distutils_enable_tests pytest
