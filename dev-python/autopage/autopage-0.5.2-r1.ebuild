# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/autopage/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"

distutils_enable_tests unittest

BDEPEND+="
	test? (
		dev-python/fixtures[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	sed -e 's/test_short_streaming_output/_&/' \
		-e 's/test_interrupt_early/_&/' \
		-i autopage/tests/test_end_to_end.py || die

	distutils-r1_src_prepare
}

python_test() {
	unset LESS PAGER
	eunittest
}
