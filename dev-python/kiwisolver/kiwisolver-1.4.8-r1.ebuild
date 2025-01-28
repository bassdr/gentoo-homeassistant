# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=kiwi-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kiwisolver/"
SRC_URI="
	https://github.com/nucleic/kiwi/archive/${PV}.tar.gz -> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Clear-BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

COMMON_DEPEND="
	>=dev-python/cppy-1.3.0[${PYTHON_USEDEP}]
"

RDEPEND="
	${COMMON_DEPEND}
"
BDEPEND="
	${COMMON_DEPEND}
	>=dev-python/setuptools-scm-3.4.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
