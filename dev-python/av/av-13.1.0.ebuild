# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Pythonic bindings for FFmpeg's libraries."
HOMEPAGE="
  https://pypi.org/project/av/
  Bug Reports, https://github.com/PyAV-Org/PyAV/issues
  Documentation, https://pyav.basswood-io.com
  Download, https://pypi.org/project/av
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

RDEPEND="!dev-python/ha-av
	<media-video/ffmpeg-7
	dev-python/ha-ffmpeg[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/${PN}-13.1.0-ffmpeg6.patch" )

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
