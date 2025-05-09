# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A simple async python wrapper for the Monzo API, used primarily by the Monzo Home Assistant integration."
HOMEPAGE="
  https://pypi.org/project/monzopy/
  Homepage, https://github.com/JakeMartin-ICL/monzopy
  Bug Tracker, https://github.com/JakeMartin-ICL/monzopy/issues
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"
