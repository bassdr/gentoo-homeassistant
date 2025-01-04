# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

MY_P=mypy_extensions-${PV}
DESCRIPTION="Type system extensions for programs checked with the mypy type checker."
HOMEPAGE="
  https://pypi.org/project/mypy-extensions/
"
SRC_URI="
	https://github.com/python/mypy_extensions/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

python_test() {
	epytest tests/*.py
}
