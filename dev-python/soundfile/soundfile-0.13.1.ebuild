# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/soundfile/"
MY_PN="SoundFile"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cffi>=1.0
	numpy
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND} media-libs/libsndfile
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
