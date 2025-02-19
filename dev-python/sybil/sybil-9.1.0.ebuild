# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sybil/"
# tests are missing in sdist, as of 5.0.1
SRC_URI="
	https://github.com/simplistix/sybil/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs pytest release test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo; extra == 'docs'
	mypy; extra == 'test'
	myst_parser; extra == 'test'
	pytest-cov; extra == 'test'
	pytest>=8; extra == 'pytest'
	pytest>=8; extra == 'test'
	seedir; extra == 'test'
	sphinx; extra == 'docs'
	testfixtures; extra == 'test'
	twine; extra == 'release'
	types-PyYAML; extra == 'test'
	wheel; extra == 'release'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	pytest? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	release? ( dev-python/twine[${PYTHON_USEDEP}] )
	release? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-8[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/myst-parser[${PYTHON_USEDEP}]
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/seedir[${PYTHON_USEDEP}]
		dev-python/testfixtures[${PYTHON_USEDEP}]
		dev-python/types-pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/seedir[${PYTHON_USEDEP}]
		dev-python/testfixtures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
