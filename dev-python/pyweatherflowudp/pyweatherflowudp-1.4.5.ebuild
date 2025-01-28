# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="An event-based asynchronous library to read UDP packets from Weatherflow weather systems on a local network without any reliance on the cloud."
HOMEPAGE="
  https://pypi.org/project/pyweatherflowudp/
  Repository, https://github.com/briis/pyweatherflowudp
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/pint-0.19[${PYTHON_USEDEP}]
	dev-python/pint[${PYTHON_USEDEP}]
	>=dev-python/psychrolib-2.5.0[${PYTHON_USEDEP}]
	dev-python/psychrolib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
