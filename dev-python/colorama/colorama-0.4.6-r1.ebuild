# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Cross-platform colored terminal text."
HOMEPAGE="
  https://pypi.org/project/colorama/
  Homepage, https://github.com/tartley/colorama
"
SRC_URI="
	https://github.com/tartley/colorama/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		docinto examples
		dodoc -r demos/.
		docompress -x /usr/share/doc/${PF}/examples
	fi
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# Some tests require stdout to be a TTY
	# https://github.com/tartley/colorama/issues/169
	script -eqc "${EPYTHON} -m pytest -vv -s" /dev/null \
		|| die "tests failed with ${EPYTHON}"
}
