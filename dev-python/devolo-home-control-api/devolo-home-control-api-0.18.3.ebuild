# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="devolo Home Control API in Python"
HOMEPAGE="
  https://pypi.org/project/devolo-home-control-api/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	importlib-metadata ; python_version < "3.8"
	pre-commit ; extra == 'dev'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	pytest-mock ; extra == 'test'
	requests (>=2.4.0)
	websocket-client (>=0.58.0)
	zeroconf (>=0.38.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.58.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.38.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.58.0[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
