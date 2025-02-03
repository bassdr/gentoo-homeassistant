# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 0.6.0.post2)"
S="${WORKDIR}/${PN}-0.6.0.post2"

MY_P=${PN}-${PV/_p/.post}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-tornasync/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-3.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-3.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-5.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	# Do not install the license file
	sed -i -e '/LICENSE/d' setup.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_tornasync.plugin
}
