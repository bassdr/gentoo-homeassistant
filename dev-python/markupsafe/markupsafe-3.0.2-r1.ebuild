# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Safely add untrusted strings to HTML/XML markup."
HOMEPAGE="
  https://pypi.org/project/MarkupSafe/
  Donate, https://palletsprojects.com/donate
  Documentation, https://markupsafe.palletsprojects.com/
  Changes, https://markupsafe.palletsprojects.com/changes/
  Source, https://github.com/pallets/markupsafe/
  Chat, https://discord.gg/pallets
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	if ! use native-extensions; then
		sed -i -e '/run_setup/s:True:False:' setup.py || die
	fi
}

python_compile() {
	local -x CIBUILDWHEEL=1
	distutils-r1_python_compile
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
