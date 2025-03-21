# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="PyChromecast"
inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Google Chromecast."
HOMEPAGE="
  https://pypi.org/project/pychromecast/
  Homepage, https://github.com/home-assistant-libs/pychromecast
"
DOCE="README.rst"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	casttube>=0.2.0
	protobuf>=4.25.1
	zeroconf>=0.25.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/casttube-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25.1[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.25.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/casttube-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25.1[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.135[${PYTHON_USEDEP}]
"
