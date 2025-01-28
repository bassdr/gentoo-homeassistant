# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sip/"
SRC_URI="
	https://github.com/Python-SIP/sip/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD-2 BSD"
SLOT="5"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/setuptools-69.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/tomli[${PYTHON_USEDEP}]' 3.10)
"
BDEPEND="
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/myst-parser \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
