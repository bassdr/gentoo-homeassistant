# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A library which communicates with XBee radios for zigpy"
HOMEPAGE="
  https://pypi.org/project/zigpy-xbee/
  repository, https://github.com/zigpy/zigpy-xbee
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	testing? ( >=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-7.1.2[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}] )
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
	dev-python/zigpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/zigpy-0.60.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
