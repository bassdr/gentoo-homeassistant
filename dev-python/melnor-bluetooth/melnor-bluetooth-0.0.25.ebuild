# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A small python library for discovery and interacting with Melnor, Eden, etc Bluetooth water timers."
HOMEPAGE="
  https://pypi.org/project/melnor-bluetooth/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aioconsole-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2.13[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-4.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-4.1[${PYTHON_USEDEP}]
	>=dev-python/aioconsole-0.4.1[${PYTHON_USEDEP}]"
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
