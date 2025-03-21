# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nose2/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="coverage-plugin test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage; extra == 'coverage-plugin'
	sphinx-issues; extra == 'dev'
	sphinx-rtd-theme; extra == 'dev'
	sphinx; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	coverage-plugin? ( dev-python/coverage[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/coverage-4.4.1[${PYTHON_USEDEP}]
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-issues[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme \
	dev-python/sphinx-issues

python_test() {
	"${EPYTHON}" -m nose2.__main__ -vv || die "tests failed under ${EPYTHON}"
}
