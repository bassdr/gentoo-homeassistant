# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Library for interacting with ElkM1 alarm/automation panel."
HOMEPAGE="
  https://pypi.org/project/elkm1-lib/
  Homepage, https://github.com/gwww/elkm1
  Repository, https://github.com/gwww/elkm1.git
  Issues, https://github.com/gwww/elkm1/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-ruff[${PYTHON_USEDEP}]
		dev-python/pytest-urwid[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
