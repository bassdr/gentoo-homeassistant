# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Easily serialize dataclasses to and from JSON."
HOMEPAGE="
  https://pypi.org/project/dataclasses-json/
  Repository, https://github.com/lidatong/dataclasses-json
  changelog, https://github.com/lidatong/dataclasses-json/releases
  documentation, https://lidatong.github.io/dataclasses-json/
  issues, https://github.com/lidatong/dataclasses-json/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	marshmallow<4.0.0,>=3.18.0
	typing-inspect<1,>=0.4.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}] <dev-python/marshmallow-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.4.0[${PYTHON_USEDEP}] <dev-python/typing-inspect-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/typing-inspect[${PYTHON_USEDEP}]
	dev-python/marshmallow[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	sed 's/, "poetry-dynamic-versioning"//g' -i pyproject.toml || die
	sed 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' -i pyproject.toml || die
	eapply_user
}
