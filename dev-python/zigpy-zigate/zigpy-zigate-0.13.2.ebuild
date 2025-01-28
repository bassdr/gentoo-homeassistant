# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A library which communicates with ZiGate radios for zigpy"
HOMEPAGE="
  https://pypi.org/project/zigpy-zigate/
  repository, https://github.com/zigpy/zigpy-zigate
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/gpiozero[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-7.1.2[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-mock-3.8.2[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}] )
	>=dev-python/pyusb-1.1.0[${PYTHON_USEDEP}]
	dev-python/pyusb[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
	dev-python/zigpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.60.2[${PYTHON_USEDEP}]
	>=dev-python/pyusb-1.1.0[${PYTHON_USEDEP}]
	dev-python/gpiozero[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}
