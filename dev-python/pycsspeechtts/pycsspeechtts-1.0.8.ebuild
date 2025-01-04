# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python 3 interface to Microsoft Cognitive Services Text To Speech"
HOMEPAGE="
  https://pypi.org/project/pycsspeechtts/
  Homepage, https://github.com/jeroenterheerdt/pycsspeechtts
  Bug Tracker, https://github.com/jeroenterheerdt/pycsspeechtts/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND=">=dev-python/requests-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
