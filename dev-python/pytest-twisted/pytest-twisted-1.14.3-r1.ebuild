# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-twisted/"
SRC_URI="
	https://github.com/pytest-dev/pytest-twisted/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="pyqt5 pyside2 test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	black; extra == 'dev'
	decorator
	greenlet
	pre-commit; extra == 'dev'
	pytest>=2.3
	qt5reactor[pyqt5]>=0.6.2; extra == 'pyqt5'
	qt5reactor[pyside2]>=0.6.3; extra == 'pyside2'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	>=dev-python/pytest-2.3[${PYTHON_USEDEP}]
	pyqt5? ( >=dev-python/qt5reactor-0.6.2[pyqt5,${PYTHON_USEDEP}] )
	pyside2? ( >=dev-python/qt5reactor-0.6.3[pyside2,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	>=dev-python/pytest-2.3[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	# If we let pytest-twisted autoload everywhere, it breaks tests in
	# packages that don't expect it. Apply a similar hack as for bug
	# #661218.
	sed -e 's/"pytest11": \[[^]]*\]//' -i setup.py || die

	# https://github.com/pytest-dev/pytest/issues/9280
	sed -e '/^pytest_plugins =/d' -i testing/conftest.py || die

	distutils-r1_src_prepare
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_twisted

	epytest -p pytester
}
