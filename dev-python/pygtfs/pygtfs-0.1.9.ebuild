# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Models GTFS data in a database."
HOMEPAGE="
  https://pypi.org/project/pygtfs/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	docopt
	pytz (>=2014.9)
	six
	sqlalchemy (>=0.7.8)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/docopt[${PYTHON_USEDEP}]
	>=dev-python/pytz-2014.9[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-0.7.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/sqlalchemy-0.7.8[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
