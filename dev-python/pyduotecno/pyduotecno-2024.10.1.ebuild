# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Open-source home automation platform running on Python 3."
HOMEPAGE="
  https://pypi.org/project/pyduotecno/
  Source Code, https://github.com/Cereal2nd/pyDuotecno
  Bug Reports, https://github.com/Cereal2nd/pyDuotecno/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.md"
