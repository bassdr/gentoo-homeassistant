# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for nuki.io bridges"
HOMEPAGE="
  https://pypi.org/project/pynuki/
  Repository, https://github.com/pschmitt/pynuki
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
