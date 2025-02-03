# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openapi-schema-validator/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-specifications-2023.5.2[${PYTHON_USEDEP}]
	dev-python/rfc3339-validator[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.19.1[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-specifications-2023.5.2[${PYTHON_USEDEP}]
	dev-python/rfc3339-validator[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	sed -i -e '/--cov/d' pyproject.toml || die
}
