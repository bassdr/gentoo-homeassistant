# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="ChaCha20Poly1305 that is reuseable for asyncio"
HOMEPAGE="
  https://pypi.org/project/chacha20poly1305-reuseable/
  Bug Tracker, https://github.com/bdraco/chacha20poly1305-reuseable/issues
  Changelog, https://github.com/bdraco/chacha20poly1305-reuseable/blob/main/CHANGELOG.md
  Repository, https://github.com/bdraco/chacha20poly1305-reuseable
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]"
