# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=standalone
GENERATED_IUSE="http"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION="Protocol for Rhasspy Voice Assistant"
HOMEPAGE="
  https://pypi.org/project/wyoming/
"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

#DOCS="README.md"

REQUIRES_DIST="
	Flask==3.0.2; extra == 'http'
	swagger-ui-py==23.9.23; extra == 'http'
	zeroconf==0.88.0; extra == 'zeroconf'
"
GENERATED_RDEPEND="${RDEPEND}
	http? ( ~dev-python/flask-3.0.2[${PYTHON_USEDEP}] )
	http? ( ~dev-python/swagger-ui-py-23.9.23[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${P}-py3-none-any.whl"
}
