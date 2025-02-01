# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Client library for the thingspeak.com API"
HOMEPAGE="
  https://pypi.org/project/thingspeak/
  Documentation, https://thingspeak.readthedocs.io/
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i -e '/include = /c\' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
