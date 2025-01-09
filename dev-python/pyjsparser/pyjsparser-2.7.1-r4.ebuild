# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Fast javascript parser (based on esprima.js)"
HOMEPAGE="
  https://pypi.org/project/pyjsparser/
"

RESTRICT="!test? ( test )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"

BDEPEND="
	test? (
		dev-python/js2py[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	"${EPYTHON}" ./test_runner.py || die "tests failed with ${EPYTHON}"
}
