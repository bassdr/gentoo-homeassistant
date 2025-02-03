# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/markdown-exec/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="ansi"
IUSE="${GENERATED_IUSE} ansi"

GENERATED_RDEPEND="${RDEPEND}
	ansi? ( dev-python/pygments-ansi-color[${PYTHON_USEDEP}] )
	>=dev-python/pymdown-extensions-9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pymdown-extensions-9[${PYTHON_USEDEP}]
	ansi? (
		dev-python/pygments-ansi-color[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/markupsafe[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
