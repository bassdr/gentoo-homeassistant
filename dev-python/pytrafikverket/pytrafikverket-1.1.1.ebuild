# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Retrieve values from public API at the Swedish Transport Administration (Trafikverket)."
HOMEPAGE="
  https://pypi.org/project/pytrafikverket/
  Bug Tracker, https://github.com/gjohansson-ST/pytrafikverket/issues
  Changelog, https://github.com/gjohansson-ST/pytrafikverket/releases
  Documentation, https://github.com/gjohansson-ST/pytrafikverket
  Repository, https://github.com/gjohansson-ST/pytrafikverket
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	dev-python/aiozoneinfo[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.1.0[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
