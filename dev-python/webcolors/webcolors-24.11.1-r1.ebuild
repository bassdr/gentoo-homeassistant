# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="A library for working with the color formats defined by HTML and CSS."
HOMEPAGE="
  https://pypi.org/project/webcolors/
  Documentation, https://webcolors.readthedocs.io
  Source Code, https://github.com/ubernostrum/webcolors
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest
