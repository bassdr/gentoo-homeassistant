# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/waitress/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx>=1.8.1; extra == 'docs'
	coverage>=7.6.0; extra == 'testing'
	docutils; extra == 'docs'
	pylons-sphinx-themes>=1.0.9; extra == 'docs'
	pytest-cov; extra == 'testing'
	pytest; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pylons-sphinx-themes-1.0.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.8.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.6.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# fails on some systems, https://bugs.gentoo.org/782031
	tests/test_wasyncore.py::DispatcherWithSendTests::test_send
)

src_prepare() {
	sed -i -e 's:--cov::' setup.cfg || die
	distutils-r1_src_prepare
}
