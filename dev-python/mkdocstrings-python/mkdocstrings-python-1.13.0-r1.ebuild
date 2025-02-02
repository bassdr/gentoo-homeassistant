# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocstrings-python/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/griffe-0.49[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-autorefs-1.2[${PYTHON_USEDEP}]
	>=dev-python/mkdocstrings-0.26[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/griffe-0.49[${PYTHON_USEDEP}]
	>=dev-python/mkdocstrings-0.26.0[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-autorefs-1.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
		>=dev-python/inline-snapshot-0.18[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

export PDM_BUILD_SCM_VERSION=${PV}

python_test() {
	local EPYTEST_DESELECT=(
		# "None" meaning particular formatter not installed
		"tests/test_rendering.py::test_format_code[None-print('Hello')]"
		"tests/test_rendering.py::test_format_code[None-aaaaa(bbbbb, ccccc=1) + ddddd.eeeee[ffff] or {ggggg: hhhhh, iiiii: jjjjj}]"
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p inline_snapshot
}
