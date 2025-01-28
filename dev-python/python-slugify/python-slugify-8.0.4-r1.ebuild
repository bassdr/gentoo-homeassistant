# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A Python slugify application that also handles Unicode"
HOMEPAGE="
  https://pypi.org/project/python-slugify/
"
SRC_URI="
	https://github.com/un33k/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="unidecode"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	>=dev-python/text-unidecode-1.3[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
	unidecode? ( >=dev-python/unidecode-1.1.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
