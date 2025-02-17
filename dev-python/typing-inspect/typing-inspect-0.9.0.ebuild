# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Runtime inspection utilities for typing module."
HOMEPAGE="
  https://pypi.org/project/typing-inspect/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	mypy-extensions (>=0.3.0)
	typing (>=3.7.4) ; python_version < '3.5'
	typing-extensions (>=3.7.4)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mypy-extensions-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/mypy-extensions-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
