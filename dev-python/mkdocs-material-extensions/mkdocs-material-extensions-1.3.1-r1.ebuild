# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-material-extensions/"
SRC_URI="
	https://github.com/facelessuser/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/mkdocs-material-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
