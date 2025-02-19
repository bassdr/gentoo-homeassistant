# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Low-level, pure Python DBus protocol wrapper."
HOMEPAGE="
  https://pypi.org/project/jeepney/
  Documentation, https://jeepney.readthedocs.io/en/latest/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="test trio"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	async-timeout ; extra == 'test'
	async_generator ; extra == 'trio' and ( python_version == '3.6')
	pytest ; extra == 'test'
	pytest-asyncio >=0.17 ; extra == 'test'
	pytest-trio ; extra == 'test'
	testpath ; extra == 'test'
	trio ; extra == 'test'
	trio ; extra == 'trio'
"
GENERATED_RDEPEND="${RDEPEND}
	trio? ( dev-python/trio[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/async-timeout[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}]
		dev-python/pytest-trio[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		sys-apps/dbus
	)
"

distutils_enable_sphinx docs \
	dev-python/sphinx-rtd-theme

src_test() {
	local dbus_params=(
		$(dbus-daemon --session --print-address --fork --print-pid)
	)
	local -x DBUS_SESSION_BUS_ADDRESS=${dbus_params[0]}

	distutils-r1_src_test

	kill "${dbus_params[1]}" || die
}

python_test() {
	local EPYTEST_IGNORE=()
	if ! has_version "dev-python/pytest-trio[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=( jeepney/io/tests/test_trio.py )
	fi
	epytest
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}
