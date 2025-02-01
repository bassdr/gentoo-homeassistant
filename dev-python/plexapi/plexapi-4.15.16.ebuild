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
  https://pypi.org/project/PlexAPI/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="alert"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/requests[${PYTHON_USEDEP}]
	alert? ( >=dev-python/websocket-client-1.3.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.3.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
