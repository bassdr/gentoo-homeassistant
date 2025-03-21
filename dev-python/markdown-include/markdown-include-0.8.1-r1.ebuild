# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/markdown-include/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	markdown (>=3.0)
	pytest ; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/markdown-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/markdown-3.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-6.2[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/${PN}-0.8.1-setup.patch
)

distutils_enable_tests pytest
