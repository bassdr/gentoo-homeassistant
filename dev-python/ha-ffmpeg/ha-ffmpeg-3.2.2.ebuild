# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION="A library that handling with ffmpeg for home-assistant"
HOMEPAGE="
  https://pypi.org/project/ha-ffmpeg/
"
SRC_URI="https://github.com/home-assistant-libs/${PN}/archive/refs/tags/${PV}.tar.gz -> ${PV}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="test"

DOCS="README.md"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/async-timeout[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	media-video/ffmpeg"
