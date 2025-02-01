# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parameterized/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${P}-py312-test.patch"
	# https://github.com/wolever/parameterized/pull/176
	"${FILESDIR}/${P}-py313-test.patch"
)

distutils_enable_tests unittest
BDEPEND+=" test? (
	dev-python/jinja2[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
