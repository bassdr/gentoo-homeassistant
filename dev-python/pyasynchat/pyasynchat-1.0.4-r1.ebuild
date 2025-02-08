# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyasynchat/"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	pyasyncore >=1.0.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyasyncore-1.0.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyasyncore-1.0.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/test[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

python_test() {
	eunittest tests
}
