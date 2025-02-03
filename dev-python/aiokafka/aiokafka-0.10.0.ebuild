# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Kafka integration with asyncio"
HOMEPAGE="
  https://pypi.org/project/aiokafka/
  Documentation, http://aiokafka.readthedocs.org
  Source, https://github.com/aio-libs/aiokafka
  Changes, https://github.com/aio-libs/aiokafka/blob/master/CHANGES.rst
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all gssapi lz4 snappy zstd"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	all? ( dev-python/cramjam[${PYTHON_USEDEP}] )
	snappy? ( dev-python/cramjam[${PYTHON_USEDEP}] )
	zstd? ( dev-python/cramjam[${PYTHON_USEDEP}] )
	all? ( dev-python/gssapi[${PYTHON_USEDEP}] )
	gssapi? ( dev-python/gssapi[${PYTHON_USEDEP}] )
	all? ( >=dev-python/lz4-3.1.3[${PYTHON_USEDEP}] )
	lz4? ( >=dev-python/lz4-3.1.3[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]"
BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
