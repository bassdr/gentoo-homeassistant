# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A library to query Minecraft Servers for their status and capabilities."
HOMEPAGE="
  https://pypi.org/project/mcstatus/
  Repository, https://github.com/py-mine/mcstatus
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	asyncio-dgram (>=2.1.2,<3.0.0)
	dnspython (>=2.4.2,<3.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asyncio-dgram-2.1.2[${PYTHON_USEDEP}] <dev-python/asyncio-dgram-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.4.2[${PYTHON_USEDEP}] <dev-python/dnspython-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/asyncio-dgram-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.4.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove unsupported dynamic-versioning plugin
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	sed 's/, "poetry-dynamic-versioning"//g' -i pyproject.toml || die
	sed 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests unittest
