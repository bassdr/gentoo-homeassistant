# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library which communicates with Deconz radios for zigpy"
HOMEPAGE="
  https://pypi.org/project/zigpy-deconz/
  repository, https://github.com/zigpy/zigpy-deconz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/zigpy-0.68.0[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-3.8.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
)"
