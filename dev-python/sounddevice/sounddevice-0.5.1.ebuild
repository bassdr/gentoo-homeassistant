# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sounddevice/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="numpy"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/cffi-1.0[${PYTHON_USEDEP}]
	numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"
