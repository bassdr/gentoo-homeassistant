# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Control your Sisyphus kinetic art tables (sisyphus-industries.com)"
HOMEPAGE="
  https://pypi.org/project/sisyphus-control/
  Repository, https://github.com/jkeljo/sisyphus-control
"
SRC_URI="https://github.com/jkeljo/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/netifaces-0.12.0[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	<dev-python/python-engineio-v3-4.0.0[${PYTHON_USEDEP}]
	dev-python/python-engineio-v3[${PYTHON_USEDEP}]
	<dev-python/python-socketio-v4-5.0.0[${PYTHON_USEDEP}]
	dev-python/python-socketio-v4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6.1[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.14.2[${PYTHON_USEDEP}]"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["poetry>=0.12"]\nbuild-backend = "poetry.masonry.api"\n' >> pyproject.toml  || die
	eapply_user
}

distutils_enable_tests pytest
