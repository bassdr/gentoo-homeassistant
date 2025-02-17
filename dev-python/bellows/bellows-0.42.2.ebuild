# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library implementing EZSP"
HOMEPAGE="
  https://pypi.org/project/bellows/
  repository, https://github.com/zigpy/bellows
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	async-timeout; python_version < '3.11'
	click
	click-log>=0.2.1
	pure_pcapy3==1.0.1
	pytest-asyncio>=0.19.0; extra == 'testing'
	pytest-cov>=3.0.0; extra == 'testing'
	pytest-mock>=3.8.2; extra == 'testing'
	pytest-timeout>=2.1.0; extra == 'testing'
	pytest>=7.1.2; extra == 'testing'
	voluptuous
	zigpy>=0.70.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/click-log-0.2.1[${PYTHON_USEDEP}]
	~dev-python/pure-pcapy3-1.0.1[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/click-log-0.2.1[${PYTHON_USEDEP}]
	~dev-python/pure-pcapy3-1.0.1[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.68.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.1.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.19.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.8.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
