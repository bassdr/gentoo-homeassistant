# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to interface an SMA Solar WebConnect module"
HOMEPAGE="
  https://pypi.org/project/pysma/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>dev-python/attrs-18[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	<dev-python/jmespath-2[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.3[${PYTHON_USEDEP}]
	>=dev-python/attrs-18[${PYTHON_USEDEP}]
	<dev-python/jmespath-2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
