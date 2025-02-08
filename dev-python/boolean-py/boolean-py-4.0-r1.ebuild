# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/-/.}
DESCRIPTION="Define boolean algebras, create and parse boolean expressions and create custom boolean DSL."
HOMEPAGE="
  https://pypi.org/project/boolean-py/
"
SRC_URI="
	https://github.com/bastikr/boolean.py/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
