# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Remote control your Mediaroom Set-up-box"
HOMEPAGE="
  https://pypi.org/project/pymediaroom/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
