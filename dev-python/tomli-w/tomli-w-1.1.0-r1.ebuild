# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A lil' TOML writer"
HOMEPAGE="
  https://pypi.org/project/tomli-w/
  Changelog, https://github.com/hukkin/tomli-w/blob/master/CHANGELOG.md
  Homepage, https://github.com/hukkin/tomli-w
"
SRC_URI="
	https://github.com/hukkin/tomli-w/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/tomli[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest tests
}
