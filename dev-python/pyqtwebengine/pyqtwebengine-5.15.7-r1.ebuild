# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=sip
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="PyQtWebEngine"
inherit distutils-r1 flag-o-matic multiprocessing pypi qmake-utils

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyqtwebengine/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="debug"

DEPEND="
	>=dev-python/pyqt5-5.15.5[gui,network,printsupport,ssl,webchannel,widgets,${PYTHON_USEDEP}]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtwebengine:5[widgets]
"
REQUIRES_DIST="
	PyQt5-sip<13,>=12.13
	PyQt5>=5.15.4
	PyQtWebEngine-Qt5<5.16.0,>=5.15.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyqt5-5.15.4[${PYTHON_USEDEP}]
	>=dev-python/pyqt5-sip-12.13[${PYTHON_USEDEP}] <dev-python/pyqt5-sip-13[${PYTHON_USEDEP}]
	>=dev-python/pyqtwebengine-qt5-5.15.0[${PYTHON_USEDEP}] <dev-python/pyqtwebengine-qt5-5.16.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	>=dev-python/pyqt5-sip-12.15:=[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pyqt-builder-1.9[${PYTHON_USEDEP}]
	>=dev-python/sip-6.8.6[${PYTHON_USEDEP}]
	dev-qt/qtcore:5
"

python_configure_all() {
	append-cxxflags ${CPPFLAGS} # respect CPPFLAGS notably for DISTUTILS_EXT=1

	DISTUTILS_ARGS=(
		--jobs="$(makeopts_jobs)"
		--qmake="$(qt5_get_bindir)"/qmake
		--qmake-setting="$(qt5_get_qmake_args)"
		--verbose
		$(usev debug '--debug --qml-debug --tracing')
	)
}
