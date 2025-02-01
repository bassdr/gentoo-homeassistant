# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=standalone
inherit distutils-r1 pypi

DESCRIPTION="Python-base APIs and tools for CHIP."
HOMEPAGE="
  https://pypi.org/project/home-assistant-chip-clusters/
"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/aenum[${PYTHON_USEDEP}]
	dev-python/dacite[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/unicode-rbnf[${PYTHON_USEDEP}]
	~dev-python/aenum-3.1.15[${PYTHON_USEDEP}]
	dev-python/aiorun[${PYTHON_USEDEP}]
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${PN//-/_}-${PV}-py3-none-any.whl"
}
