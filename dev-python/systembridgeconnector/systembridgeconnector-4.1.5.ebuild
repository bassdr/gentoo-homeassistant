# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="System Bridge Connector"
HOMEPAGE="
  https://pypi.org/project/systembridgeconnector/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${RDEPEND}
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.9_beta0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/incremental-24.7.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	>=dev-python/systembridgemodels-4.2.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/incremental-24.7.2[${PYTHON_USEDEP}]"

src_prepare() {
	echo -e "aiohttp\nincremental>=24.7.2\n" > requirements.txt
	echo -e "incremental>=24.7.2" > requirements_setup.txt
	eapply_user
}

distutils_enable_tests pytest
