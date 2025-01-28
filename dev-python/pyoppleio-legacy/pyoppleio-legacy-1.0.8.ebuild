# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python library for interfacing with old models of opple lights with wifi control."
HOMEPAGE="
  https://pypi.org/project/pyoppleio-legacy/
"
COMMIT="90c57f778554fcf3a00e42757d0e92caebcfd149"
SRC_URI="https://github.com/tinysnake/python-oppleio-legacy/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
HIS_PN="python-oppleio-legacy"
S="${WORKDIR}/${HIS_PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pycrc16[${PYTHON_USEDEP}]
	~dev-python/pycrc16-0.1.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pycrc16[${PYTHON_USEDEP}]"
BDEPEND="

	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
