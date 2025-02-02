# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Open World Holidays Framework"
HOMEPAGE="
  https://pypi.org/project/holidays/
  Documentation, https://holidays.readthedocs.io/en/latest/
  Repository, https://github.com/vacanza/holidays/
  Changelog, https://github.com/vacanza/holidays/releases/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/python-dateutil[${PYTHON_USEDEP}]"
