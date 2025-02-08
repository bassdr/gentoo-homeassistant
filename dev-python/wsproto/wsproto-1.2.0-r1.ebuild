# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="WebSockets state-machine based protocol implementation"
HOMEPAGE="
  https://pypi.org/project/wsproto/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	h11 (<1,>=0.9.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/h11-0.9.0[${PYTHON_USEDEP}] <dev-python/h11-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/h11-0.9[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
