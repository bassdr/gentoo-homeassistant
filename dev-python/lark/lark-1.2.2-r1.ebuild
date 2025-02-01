# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="a modern parsing library"
HOMEPAGE="
  https://pypi.org/project/lark/
  Homepage, https://github.com/lark-parser/lark
  Download, https://github.com/lark-parser/lark/tarball/master
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# dev-python/regex doesn't support pypy
GENERATED_IUSE="atomic-cache interegular nearley regex"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	atomic-cache? ( dev-python/atomicwrites[${PYTHON_USEDEP}] )
	interegular? ( <dev-python/interegular-0.4.0[${PYTHON_USEDEP}] )
	nearley? ( dev-python/js2py[${PYTHON_USEDEP}] )
	regex? ( dev-python/regex[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/atomicwrites[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/regex[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# require dev-python/js2py which is a really bad quality package
		tests/test_nearley/test_nearley.py
	)

	epytest
}
# RDEPEND could not be inserted in this ebuild
