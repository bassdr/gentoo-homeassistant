# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 virtualx pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cmd2/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/pyperclip-1.8[${PYTHON_USEDEP}]
	>=dev-python/wcwidth-0.2.10[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pyperclip[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
# pyperclip uses clipboard backends in the following preference order:
# pygtk, xclip, xsel, klipper, qtpy, pyqt5, pyqt4.
# klipper is known to be broken in Xvfb, and therefore causes test
# failures.  to avoid them, we must ensure that one of the backends
# preferred to it is available (i.e. xclip or xsel).
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		|| (
			x11-misc/xclip
			x11-misc/xsel
		)
	)
"

distutils_enable_tests pytest

src_test() {
	# tests rely on very specific text wrapping...
	local -x COLUMNS=80
	virtx distutils-r1_src_test
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# TODO: tests_isolated?
	epytest -o addopts= -p pytest_mock tests || die
}
