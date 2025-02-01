# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=flit
PYPI_PN="svg.py"
inherit distutils-r1 pypi

DESCRIPTION="SVG drawing library"
HOMEPAGE="
  https://pypi.org/project/svg.py/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"
DOCS="README.md"
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/isort[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
)"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
