# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/execnet/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

distutils_enable_sphinx doc
distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/hatch[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		python3.13t)
			EPYTEST_DESELECT+=(
				# https://github.com/pytest-dev/execnet/issues/306
				testing/test_channel.py::TestChannelBasicBehaviour::test_channel_callback_remote_freed
			)
			;;
	esac

	# the test suite checks if bytecode writing can be disabled/enabled
	local -x PYTHONDONTWRITEBYTECODE=
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# some tests are implicitly run against both sys.executable
	# and pypy3, which is redundant and results in pypy3 bytecode being
	# written to cpython install dirs
	epytest testing -k "not pypy3"
}
# RDEPEND could not be inserted in this ebuild
