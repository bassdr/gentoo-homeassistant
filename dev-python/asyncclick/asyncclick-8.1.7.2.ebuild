# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Composable command line interface toolkit, async version"
HOMEPAGE="
  https://pypi.org/project/asyncclick/
  Source Code, https://github.com/python-trio/asyncclick
  Issue Tracker, https://github.com/python-trio/asyncclick/issues/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/anyio[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/anyio[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
