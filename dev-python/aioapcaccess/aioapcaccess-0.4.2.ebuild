# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async version of apcaccess library implemented in python."
HOMEPAGE="
  https://pypi.org/project/aioapcaccess/
"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${P}-py3-none-any.whl"
}
# RDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
