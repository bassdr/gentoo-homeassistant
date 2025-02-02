# Copyright 2008-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Default implementation currently is upb, which doesn't match dev-libs/protobuf
# https://github.com/protocolbuffers/protobuf/blob/main/python/README.md#implementation-backends

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/protobuf/
"

# Rename sdist to avoid conflicts with dev-libs/protobuf

LICENSE="BSD"
SLOT="0/$(ver_cut 1-3)"
KEYWORDS="amd64 arm64"
