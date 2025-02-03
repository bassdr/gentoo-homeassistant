# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tuf/"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/securesystemslib-1.0[${PYTHON_USEDEP}] =dev-python/securesystemslib-1*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	<dev-python/securesystemslib-2[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_test() {
	cd tests || die
	local -x PYTHONPATH="..:${PYTHONPATH}"
	eunittest
}
