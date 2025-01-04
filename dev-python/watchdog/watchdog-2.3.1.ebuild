# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="Filesystem events monitoring"
HOMEPAGE="
  https://pypi.org/project/watchdog/
  Documentation, https://python-watchdog.readthedocs.io/en/stable/
  Source, https://github.com/gorakhargosh/watchdog/
  Issues, https://github.com/gorakhargosh/watchdog/issues
  Changelog, https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-timeout-0.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# known flaky
		tests/test_emitter.py::test_close
		# requires root powers via sudo (yes, seriously)
		tests/test_inotify_buffer.py::test_unmount_watched_directory_filesystem
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# there's a test opening 2048 files
	ulimit -n 4096 || die
	epytest -o addopts=
}

pkg_postinst() {
	optfeature "Bash completion" dev-python/argcomplete
}
