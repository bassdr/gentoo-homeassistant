# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Big Ass Fans i6/Haiku protocol asynchronous Python library"
HOMEPAGE="
  https://pypi.org/project/aiobafi6/
  Repository, https://github.com/jfroy/aiobafi6
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	protobuf (>=3.20)
	zeroconf (>=0.38)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/protobuf-3.20[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.38[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/protobuf-3.20[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.38.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
