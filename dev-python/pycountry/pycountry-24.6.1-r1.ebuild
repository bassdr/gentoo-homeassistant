# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="ISO country, subdivision, language, currency and script definitions and their translations"
HOMEPAGE="
  https://pypi.org/project/pycountry/
  Repository, https://github.com/flyingcircusio/pycountry
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -o required_plugins=
}
