# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=sphinxcontrib_github_alt-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib_github_alt/"
SRC_URI="
	https://github.com/jupyter/sphinxcontrib_github_alt/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	!dev-python/sphinxcontrib_github_alt
"
BDEPEND="
	dev-python/sphinx[${PYTHON_USEDEP}]
"
