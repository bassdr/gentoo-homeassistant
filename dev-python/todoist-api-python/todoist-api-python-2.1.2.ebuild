# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Official Python SDK for the Todoist REST API."
HOMEPAGE="
  https://pypi.org/project/todoist-api-python/
  Documentation, https://developer.todoist.com/rest/
  Repository, https://github.com/Doist/todoist-api-python
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	requests (>=2.26.0,<3.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# "LICENSE",

src_prepare() {
	sed -e '/include =/,/]/d' -i pyproject.toml || die
	eapply_user
}
