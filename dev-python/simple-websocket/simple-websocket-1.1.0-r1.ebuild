# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Simple WebSocket server and client for Python"
HOMEPAGE="
  https://pypi.org/project/simple-websocket/
  Homepage, https://github.com/miguelgrinberg/simple-websocket
  Bug Tracker, https://github.com/miguelgrinberg/simple-websocket/issues
"
# upstream refuses to provide working tests in sdist
# https://github.com/miguelgrinberg/simple-websocket/issues/31
SRC_URI="
	https://github.com/miguelgrinberg/simple-websocket/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	flake8; extra == 'dev'
	pytest-cov; extra == 'dev'
	pytest; extra == 'dev'
	sphinx; extra == 'docs'
	tox; extra == 'dev'
	wsproto
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/wsproto[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/wsproto[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare

	# fix tests to work offline
	# https://github.com/miguelgrinberg/simple-websocket/commit/159e030c7c23060de989cebec6d98d776c75bcbd
	sed -i -e 's:example\.com:localhost:g' tests/test_client.py || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
