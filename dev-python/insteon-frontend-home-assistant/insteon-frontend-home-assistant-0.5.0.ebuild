# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="The Insteon frontend for Home Assistant"
HOMEPAGE="
  https://pypi.org/project/insteon-frontend-home-assistant/
  Homepage, https://github.com/pyinsteon/insteon-panel
"

MY_PN="insteon-panel"
SRC_URI="https://github.com/pyinsteon/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.md"
