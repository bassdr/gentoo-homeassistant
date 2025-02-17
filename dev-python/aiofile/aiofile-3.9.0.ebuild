# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous file operations."
HOMEPAGE="
  https://pypi.org/project/aiofile/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	caio<0.10.0,>=0.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/caio-0.9.0[${PYTHON_USEDEP}] <dev-python/caio-0.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
