# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools for converting bluetooth data and packets"
HOMEPAGE="
  https://pypi.org/project/bluetooth-data-tools/
  Bug Tracker, https://github.com/bdraco/bluetooth-data-tools/issues
  Changelog, https://github.com/bdraco/bluetooth-data-tools/blob/main/CHANGELOG.md
  Documentation, https://bluetooth-data-tools.readthedocs.io
  Repository, https://github.com/bdraco/bluetooth-data-tools
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cryptography-41.0.3[${PYTHON_USEDEP}]
	docs? ( <dev-python/myst-parser-1.1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"
BDEPEND="
	>=dev-python/cryptography-41.0.3[${PYTHON_USEDEP}]
	>=dev-python/cython-3.0.2[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
