# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/quart/"
# no tests in sdist as of 0.20.0
SRC_URI="
	https://github.com/pallets/quart/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dotenv"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiofiles
	blinker>=1.6
	click>=8.0
	flask>=3.0
	hypercorn>=0.11.2
	importlib-metadata; python_version < '3.10'
	itsdangerous
	jinja2
	markupsafe
	python-dotenv; extra == 'dotenv'
	typing-extensions; python_version < '3.10'
	werkzeug>=3.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/blinker-1.6[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/flask-3.0[${PYTHON_USEDEP}]
	>=dev-python/hypercorn-0.11.2[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	dotenv? ( dev-python/python-dotenv[${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/blinker-1.6[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/hypercorn-0.11.2[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p asyncio
}
