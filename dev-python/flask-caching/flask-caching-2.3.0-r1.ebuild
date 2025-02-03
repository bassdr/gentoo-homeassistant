# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-caching/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/cachelib-0.10.0[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/cachelib-0.9.0[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/asgiref[${PYTHON_USEDEP}]
		dev-python/pylibmc[sasl(-),${PYTHON_USEDEP}]
		dev-python/redis[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-xprocess[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# fix check for obsolete package name
	sed -i -e '/pytest_xprocess/d' tests/conftest.py || die
	# remove pinned deps
	sed -i -e '/install_requires/d' setup.py || die
}
