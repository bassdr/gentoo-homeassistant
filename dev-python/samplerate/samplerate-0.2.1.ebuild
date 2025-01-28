# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/samplerate/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} media-libs/libsamplerate
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"
BDEPEND="dev-python/pybind11[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}/${PN}-meson.patch"
)

distutils_enable_tests pytest
