# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="WebSocket client for Python with low level API options"
HOMEPAGE="
  https://pypi.org/project/websocket-client/
  Documentation, https://websocket-client.readthedocs.io/
  Source, https://github.com/websocket-client/websocket-client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs optional test"
IUSE="${GENERATED_IUSE} examples test"

REQUIRES_DIST="
	Sphinx>=6.0; extra == 'docs'
	myst-parser>=2.0.0; extra == 'docs'
	python-socks; extra == 'optional'
	sphinx-rtd-theme>=1.1.0; extra == 'docs'
	websockets; extra == 'test'
	wsaccel; extra == 'optional'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/myst-parser-2.0.0[${PYTHON_USEDEP}] )
	optional? ( dev-python/python-socks[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.1.0[${PYTHON_USEDEP}] )
	optional? ( dev-python/wsaccel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/websockets[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/python-socks[${PYTHON_USEDEP}]
	)
"


python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}
