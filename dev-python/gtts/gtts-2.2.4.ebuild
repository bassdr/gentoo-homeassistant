# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="gTTS (Google Text-to-Speech), a Python library and CLI tool to interface with Google Translate text-to-speech API"
HOMEPAGE="
  https://pypi.org/project/gTTS/
"
SRC_URI="https://github.com/pndurette/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs tests"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/click[${PYTHON_USEDEP}]
	tests? ( dev-python/flake8[${PYTHON_USEDEP}] )
	tests? ( dev-python/mock[${PYTHON_USEDEP}] )
	tests? ( ~dev-python/pytest-4.6.11[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	tests? ( dev-python/six[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	tests? ( dev-python/testfixtures[${PYTHON_USEDEP}] )
	docs? ( dev-python/towncrier[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
dev-python/six[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
# PYPI_PN could not be inserted in this ebuild
