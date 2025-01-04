# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Bringing the elegance of C# EventHandler to Python"
HOMEPAGE="
  https://pypi.org/project/Events/
"
# No sdist in pypi as of PV=0.5
SRC_URI="
	https://github.com/pyeve/events/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest

# PYPI_PN could not be inserted in this ebuild
