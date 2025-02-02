# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A dot-accessible dictionary (a la JavaScript objects)"
HOMEPAGE="
  https://pypi.org/project/munch/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="yaml"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/importlib-metadata-1.7.0[${PYTHON_USEDEP}]
	yaml? ( >=dev-python/pyyaml-5.1.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/astroid-2.0[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	~dev-python/pylint-2.3.1[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"

PATCHES=(
	# https://github.com/Infinidat/munch/pull/104
	"${FILESDIR}/${P}-py313.patch"
)
# RDEPEND could not be inserted in this ebuild
