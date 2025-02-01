# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/multiprocess/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/dill-0.3.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/dill-0.3.9[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/test[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

src_prepare() {
	local PATCHES=(
		# https://github.com/uqfoundation/multiprocess/pull/197
		"${FILESDIR}/${P}-wheel-tag.patch"
	)

	distutils-r1_src_prepare

	# https://github.com/uqfoundation/multiprocess/issues/196
	sed -i -e '/python-tag/d' setup.cfg || die
}

python_test() {
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	eunittest
}
