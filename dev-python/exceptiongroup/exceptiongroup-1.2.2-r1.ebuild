# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit_scm
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Backport of PEP 654 (exception groups)"
HOMEPAGE="
  https://pypi.org/project/exceptiongroup/
  Changelog, https://github.com/agronholm/exceptiongroup/blob/main/CHANGES.rst
  Issue Tracker, https://github.com/agronholm/exceptiongroup/issues
  Source code, https://github.com/agronholm/exceptiongroup
"

LICENSE="MIT PSF-2.4"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
)"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
