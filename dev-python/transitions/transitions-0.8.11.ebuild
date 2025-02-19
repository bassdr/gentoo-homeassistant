# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A lightweight, object-oriented Python state machine implementation with many extensions."
HOMEPAGE="
  https://pypi.org/project/transitions/
"
SRC_URI="
	https://github.com/pytransitions/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="diagrams test"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	pygraphviz ; extra == 'diagrams'
	pytest ; extra == 'test'
	six
"
GENERATED_RDEPEND="${RDEPEND}
	diagrams? ( dev-python/pygraphviz[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	|| (
		dev-python/pygraphviz[${PYTHON_USEDEP}]
		dev-python/graphviz[${PYTHON_USEDEP}]
	)
	dev-python/six[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/dill[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# pycodestyle, mypy, etc.
		tests/test_codestyle.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

src_install() {
	distutils-r1_src_install
	use examples && dodoc examples/*.ipynb
}
