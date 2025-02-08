# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flufl-lock/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	atpublic
	psutil
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/atpublic[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/atpublic[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/sybil[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -e '/addopts/d' -i pyproject.toml || die
	distutils-r1_src_prepare
}
