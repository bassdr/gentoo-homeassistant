# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 virtualx xdg-utils

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyglet/"
SRC_URI="https://github.com/pyglet/pyglet/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples image +sound"

RDEPEND="
	virtual/glu
	virtual/opengl
	image? (
		|| (
			dev-python/pillow[${PYTHON_USEDEP}]
			x11-libs/gtk+:2
		)
	)
	sound? (
		|| (
			media-libs/libpulse
			media-libs/openal
		)
	)
"
#	ffmpeg? ( media-libs/avbin-bin )
BDEPEND="
	test? (
		dev-python/pillow[${PYTHON_USEDEP}]
		media-libs/fontconfig
	)
"

distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	xdg_environment_reset

	local EPYTEST_DESELECT=(
		# lacking device/server permissions
		tests/unit/media/test_listener.py::test_openal_listener
		tests/unit/media/test_listener.py::test_pulse_listener
		# fragile to system load
		tests/unit/media/test_player.py::PlayerTestCase::test_pause_resume
		tests/unit/test_clock_freq.py::test_elapsed_time_between_tick
	)

	# Specify path to avoid running interactive tests
	# We could add in integration tests, but they're slow
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	nonfatal epytest tests/unit || die "Tests failed with ${EPYTHON}"
}

python_install_all() {
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi

	distutils-r1_python_install_all
}
