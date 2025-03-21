# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Work with the Webex APIs in native Python!"
HOMEPAGE="
  https://pypi.org/project/webexpythonsdk/
  Documentation, https://webexcommunity.github.io/WebexPythonSDK
  Repository, https://github.com/WebexCommunity/WebexPythonSDK
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	PyJWT<3.0.0,>=2.8.0
	requests-toolbelt<2.0.0,>=1.0.0
	requests<3.0.0,>=2.32.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}] <dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}] <dev-python/requests-toolbelt-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i -e '/include = /d' pyproject.toml || die
	distutils-r1_src_prepare
	}

distutils_enable_tests pytest
