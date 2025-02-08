# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python ecotrend-ista Api"
HOMEPAGE="
  https://pypi.org/project/pyecotrend-ista/
  Bug Tracker, https://github.com/Ludy87/pyecotrend-ista/issues
  Homepage, https://github.com/Ludy87/pyecotrend-ista
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	dataclasses-json>=0.6
	requests>=2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dataclasses-json-0.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/dataclasses-json[${PYTHON_USEDEP}]"

src_prepare() {
	touch requirements.txt || die
	eapply_user
}

distutils_enable_tests pytest
