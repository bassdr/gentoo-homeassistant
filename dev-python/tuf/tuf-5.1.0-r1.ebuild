# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A secure updater framework for Python"
HOMEPAGE="
  https://pypi.org/project/tuf/
  Documentation, https://theupdateframework.readthedocs.io/en/stable/
  Homepage, https://www.updateframework.com
  Issues, https://github.com/theupdateframework/python-tuf/issues
  Source, https://github.com/theupdateframework/python-tuf
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	requests>=2.19.1
	securesystemslib~=1.0
"
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
