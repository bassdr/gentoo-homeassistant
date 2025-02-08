# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="MPython module to talk to Husqvarna Automower."
HOMEPAGE="
  https://pypi.org/project/aioautomower/
  Documentation, https://github.com/Thomas55555/aioautomower
  Issues, https://github.com/Thomas55555/aioautomower/issues
  Repository, https://github.com/Thomas55555/aioautomower
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	PyJWT<3.0.0,>=2.8.0
	aiohttp<4.0.0,>=3.9.3
	ical>=8.0.1
	mashumaro<4.0,>=3.12
	python-dateutil<3.0.0,>=2.9.0-post.0
	tzlocal<6.0,>=5.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/ical-8.0.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}] <dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0_p.0[${PYTHON_USEDEP}] <dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.2[${PYTHON_USEDEP}] <dev-python/tzlocal-6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/ical-8.0.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
