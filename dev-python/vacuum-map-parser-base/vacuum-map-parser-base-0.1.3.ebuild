# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Common code for vacuum map parsers"
HOMEPAGE="
  https://pypi.org/project/vacuum-map-parser-base/
  Bug Tracker, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-base/issues
  Changelog, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-base/releases
  Homepage, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-base
  Repository, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-base
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
