# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi
DESCRIPTION="Asynchronous library to control Rollease Acmeda Automate roller blinds via a version 1 Pulse Hub."
HOMEPAGE="
  https://pypi.org/project/aiopulse/
  Homepage, https://github.com/atmurray/aiopulse
  Issues, https://github.com/atmurray/aiopulse/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/async-timeout[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
