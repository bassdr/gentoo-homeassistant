# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library for ecoforest local device."
HOMEPAGE="
  https://pypi.org/project/pyecoforest/
  Bug Tracker, https://github.com/pjanuario/pyecoforest/issues
  Changelog, https://github.com/pjanuario/pyecoforest/blob/main/CHANGELOG.md
  Documentation, https://pyecoforest.readthedocs.io
  Repository, https://github.com/pjanuario/pyecoforest
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/httpx[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
