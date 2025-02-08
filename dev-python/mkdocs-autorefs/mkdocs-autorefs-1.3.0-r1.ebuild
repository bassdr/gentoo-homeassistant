# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=pdm-backend

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-autorefs/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Markdown>=3.3
	markupsafe>=2.0.1
	mkdocs>=1.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/markdown-3.3[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/markdown-3.3[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-1.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pygments-2.16[${PYTHON_USEDEP}]
		>=dev-python/pymdown-extensions-10.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
