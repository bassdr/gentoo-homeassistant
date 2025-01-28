# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyenchant/"
SRC_URI="
	https://github.com/pyenchant/pyenchant/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	app-text/enchant:*
"
BDEPEND="
	test? (
		app-dicts/myspell-en
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# https://github.com/pyenchant/pyenchant/issues/313
	tests/test_pwl.py::test_dwpwl
	tests/test_pwl.py::test_suggestions
)
