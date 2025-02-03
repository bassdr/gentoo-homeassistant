# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/executing/"
SRC_URI="
	https://github.com/alexmojaki/executing/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/asttokens-2.1.0[${PYTHON_USEDEP}]
		dev-python/littleutils[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/asttokens-2.1.0[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/coverage-enable-subprocess[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/littleutils[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

PATCHES=(
	# https://github.com/alexmojaki/executing/pull/86
	"${FILESDIR}/${P}-py3126.patch"
)

python_test() {
	local EPYTEST_DESELECT=()
	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				"tests/test_main.py::test_small_samples[22bc344a43584c051d8962116e8fd149d72e7e68bcb54caf201ee6e78986b167.py]"
				"tests/test_main.py::test_small_samples[46597f8f896f11c5d7f432236344cc7e5645c2a39836eb6abdd2437c0422f0f4.py]"
			)
			;;
	esac
	if ! has_version "dev-python/ipython[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_ipython.py
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

pkg_postinst() {
	optfeature "getting node's source code" dev-python/asttokens
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
