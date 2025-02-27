# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library to gather information from ETS project files used for KNX"
HOMEPAGE="
  https://pypi.org/project/xknxproject/
  homepage, https://github.com/XKNX/xknxproject
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	pyzipper>=0.3.6
	striprtf>=0.0.26
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyzipper-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/striprtf-0.0.26[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyzipper-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/striprtf-0.0.26[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
