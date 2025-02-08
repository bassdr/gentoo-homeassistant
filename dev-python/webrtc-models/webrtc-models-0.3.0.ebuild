# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python WebRTC models"
HOMEPAGE="
  https://pypi.org/project/webrtc-models/
  Homepage, https://pypi.org/project/webrtc-models
  Source Code, https://github.com/home-assistant-libs/python-webrtc-models
  Bug Reports, https://github.com/home-assistant-libs/python-webrtc-models/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	mashumaro~=3.13
	orjson>=3.10.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}] =dev-python/mashumaro-3*[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
