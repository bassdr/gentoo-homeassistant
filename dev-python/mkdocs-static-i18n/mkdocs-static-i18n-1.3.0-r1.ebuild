# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="hatchling"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-static-i18n/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="material"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/mkdocs-1.5.2[${PYTHON_USEDEP}]
	material? ( >=dev-python/mkdocs-material-9.2.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/mkdocs-1.5.2[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		!!dev-python/mkdocs-i18n
	)
"

distutils_enable_tests pytest
