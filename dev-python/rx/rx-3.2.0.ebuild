# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="Rx"
inherit distutils-r1 virtualx pypi

DESCRIPTION="Reactive Extensions (Rx) for Python"
HOMEPAGE="
  https://pypi.org/project/rx/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}
