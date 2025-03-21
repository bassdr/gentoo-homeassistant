# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-mdinclude/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	docutils >=0.16,<1.0
	mistune >=2.0,<3.0
	pygments >= 2.8
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.16[${PYTHON_USEDEP}] <dev-python/docutils-1.0[${PYTHON_USEDEP}]
	>=dev-python/mistune-2.0[${PYTHON_USEDEP}] <dev-python/mistune-3.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/docutils-1.0[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	<dev-python/mistune-4.0[${PYTHON_USEDEP}]
	>=dev-python/mistune-3.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.8[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs
distutils_enable_tests pytest
