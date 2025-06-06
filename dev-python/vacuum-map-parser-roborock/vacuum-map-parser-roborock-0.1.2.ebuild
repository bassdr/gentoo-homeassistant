# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Functionalities for Roborock vacuum map parsing"
HOMEPAGE="
  https://pypi.org/project/vacuum-map-parser-roborock/
  Bug Tracker, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-roborock/issues
  Changelog, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-roborock/releases
  Homepage, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-roborock
  Repository, https://github.com/PiotrMachowski/Python-package-vacuum-map-parser-roborock
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	Pillow
	vacuum-map-parser-base==0.1.3
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
	~dev-python/vacuum-map-parser-base-0.1.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	eapply_user
}
