# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="windows-terminal"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 bash-completion-r1 pypi

DESCRIPTION="Pygments is a syntax highlighting package written in Python."
HOMEPAGE="
  https://pypi.org/project/pygments/
  Homepage, https://pygments.org
  Documentation, https://pygments.org/docs
  Source, https://github.com/pygments/pygments
  Bug Tracker, https://github.com/pygments/pygments/issues
  Changelog, https://github.com/pygments/pygments/blob/master/CHANGES
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	colorama>=0.4.6; extra == 'windows-terminal'
"
GENERATED_RDEPEND="${RDEPEND}
	windows-terminal? ( >=dev-python/colorama-0.4.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_DESELECT=(
	# fuzzing tests, very slow
	tests/test_basic_api.py::test_random_input
	# incompatibility with python-ctags3, apparently
	# https://github.com/pygments/pygments/issues/2486
	tests/test_html_formatter.py::test_ctags
)

EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND+="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/wcag-contrast-ratio[${PYTHON_USEDEP}]
		virtual/ttf-fonts
	)
"

src_install() {
	distutils-r1_src_install
	newbashcomp external/pygments.bashcomp pygmentize
}
