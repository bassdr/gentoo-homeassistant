# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
# py3.13: https://github.com/beetbox/audioread/issues/144
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/audioread/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="ffmpeg gstreamer mad"

GENERATED_DEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_DEPEND}
	ffmpeg? (
		media-video/ffmpeg
	)
	gstreamer? (
		dev-python/pygobject:3[${PYTHON_USEDEP}]
		media-libs/gstreamer:1.0
		media-plugins/gst-plugins-meta:1.0
	)
	mad? (
		dev-python/pymad[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pymad[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/tox[${PYTHON_USEDEP}]
)"
