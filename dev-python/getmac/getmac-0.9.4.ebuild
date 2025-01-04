# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Get MAC addresses of remote hosts and local interfaces"
HOMEPAGE="
  https://pypi.org/project/getmac/
  Changelog, https://github.com/GhostofGoes/getmac/blob/main/CHANGELOG.md
  Issue tracker, https://github.com/GhostofGoes/getmac/issues
  Source, https://github.com/GhostofGoes/getmac
  Discord server, https://discord.gg/python
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
