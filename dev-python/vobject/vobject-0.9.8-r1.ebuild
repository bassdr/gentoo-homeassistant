# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A full-featured Python package for parsing and creating iCalendar and vCard files"
HOMEPAGE="
  https://pypi.org/project/vobject/
  Home, http://py-vobject.github.io/
  GitHub, https://github.com/py-vobject/vobject
  Download, https://github.com/py-vobject/vobject/releases
  Issues, https://github.com/py-vobject/vobject/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

DOCS=( ACKNOWLEDGEMENTS.txt README.md )

distutils_enable_tests unittest
