# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1 pypi

DESCRIPTION="Python Netlink library"
HOMEPAGE="
  https://pypi.org/project/pyroute2/
"

LICENSE="|| ( GPL-2+ Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 arm64"
# tests need root access
RESTRICT="test"

GENERATED_DEPEND="
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/win-inet-pton[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"
