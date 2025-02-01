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

GENERATED_IUSE="build pytest"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	build? ( dev-python/furo[${PYTHON_USEDEP}] )
	pytest? ( >=dev-python/pytest-8[${PYTHON_USEDEP}] )
	build? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	build? ( dev-python/twine[${PYTHON_USEDEP}] )
	build? ( <dev-python/urllib3-2[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-8[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/seedir[${PYTHON_USEDEP}]
		dev-python/testfixtures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/myst-parser[${PYTHON_USEDEP}]
	>=dev-python/pytest-8[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/seedir[${PYTHON_USEDEP}]
	dev-python/testfixtures[${PYTHON_USEDEP}]
	dev-python/types-pyyaml[${PYTHON_USEDEP}]
)"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
