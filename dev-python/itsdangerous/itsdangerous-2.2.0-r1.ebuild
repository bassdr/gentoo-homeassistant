# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Safely pass data to untrusted environments and back."
HOMEPAGE="
  https://pypi.org/project/itsdangerous/
  Changes, https://itsdangerous.palletsprojects.com/changes/
  Chat, https://discord.gg/pallets
  Documentation, https://itsdangerous.palletsprojects.com/
  Donate, https://palletsprojects.com/donate
  Source, https://github.com/pallets/itsdangerous/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
