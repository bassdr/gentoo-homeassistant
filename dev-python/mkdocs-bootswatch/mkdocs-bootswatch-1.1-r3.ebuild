# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
DOCS_BUILDER="mkdocs"

inherit distutils-r1 docs

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-bootswatch/"
SRC_URI="https://github.com/mkdocs/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/mkdocs-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/mkdocs"
