# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/seedir/"
SRC_URI="
	https://github.com/earnestt1234/seedir/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="emoji"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	emoji? ( dev-python/emoji[${PYTHON_USEDEP}] )
	dev-python/natsort[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/natsort[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
