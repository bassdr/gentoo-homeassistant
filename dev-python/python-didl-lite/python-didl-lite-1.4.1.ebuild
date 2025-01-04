# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="python_didl_lite"

inherit distutils-r1 pypi

DESCRIPTION="DIDL-Lite (Digital Item Declaration Language) tools for Python"
HOMEPAGE="
  https://pypi.org/project/python_didl_lite/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/defusedxml[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}    >=dev-python/defusedxml-0.6.0"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest