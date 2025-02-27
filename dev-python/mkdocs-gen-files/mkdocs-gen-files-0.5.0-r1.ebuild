# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-gen-files/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	mkdocs>=1.0.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mkdocs-1.0.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/mkdocs-1.0.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-golden[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
