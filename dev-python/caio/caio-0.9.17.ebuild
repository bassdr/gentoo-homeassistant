# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous file IO for Linux MacOS or Windows."
HOMEPAGE="
  https://pypi.org/project/caio/
  Documentation, https://github.com/mosquito/caio/
  Source, https://github.com/mosquito/caio
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="develop"
IUSE="${GENERATED_IUSE}"

DOCS="README.rst"

REQUIRES_DIST="
	aiomisc-pytest; extra == 'develop'
	pytest-cov; extra == 'develop'
	pytest; extra == 'develop'
"
GENERATED_RDEPEND="${RDEPEND}
	develop? ( dev-python/aiomisc-pytest[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

src_prepare() {
	# TODO: WTF?
	cp ${S}/README.md ${S}/README.rst
	default
}
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
