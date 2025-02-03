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
BDEPEND="
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/astroid-2.0[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/pylint-2.3.1[${PYTHON_USEDEP}] =dev-python/pylint-2.3*[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

PATCHES=(
	# https://github.com/Infinidat/munch/pull/104
	"${FILESDIR}/${P}-py313.patch"
)
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
