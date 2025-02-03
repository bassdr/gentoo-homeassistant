# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dparse/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# Break circular dependency
GENERATED_IUSE="all conda pipenv poetry"
IUSE="${GENERATED_IUSE}"
PDEPEND="
	dev-python/pipenv[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${PDEPEND}
	)
"

distutils_enable_tests pytest
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
