# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="pushbullet.py"
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A simple python client for pushbullet.com"
HOMEPAGE="
  https://pypi.org/project/pushbullet.py/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="readme.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/python-magic[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.53.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
