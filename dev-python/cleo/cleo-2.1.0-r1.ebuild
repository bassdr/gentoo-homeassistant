# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cleo/"
SRC_URI="
	https://github.com/python-poetry/cleo/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	crashtest (>=0.4.1,<0.5.0)
	rapidfuzz (>=3.0.0,<4.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/crashtest-0.4.1[${PYTHON_USEDEP}] <dev-python/crashtest-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.0.0[${PYTHON_USEDEP}] <dev-python/rapidfuzz-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/crashtest[${PYTHON_USEDEP}]
	dev-python/rapidfuzz[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	# unpin rapidfuzz
	sed -i -e '/rapidfuzz/s:\^:>=:' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				tests/ui/test_exception_trace.py::test_render_debug_better_error_message_recursion_error
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_mock
	epytest
}
