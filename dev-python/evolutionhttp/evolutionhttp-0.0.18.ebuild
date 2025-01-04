# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="An HTTP client for controlling a Bryant Evolution HVAC system"
HOMEPAGE="
  https://pypi.org/project/evolutionhttp/
  Homepage, https://github.com/danielsmyers/evolutionhttp
  Issues, https://github.com/danielsmyers/evolutionhttp/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
distutils_enable_tests pytest
