# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PN="RestrictedPython"
MY_PV1=${PV/_beta/b}
MY_PV=${MY_PV1/_alpha/a}

DESCRIPTION="RestrictedPython is a defined subset of the Python language which allows to provide a program input into a trusted environment."
HOMEPAGE="
  https://pypi.org/project/restrictedpython/
  Documentation, https://restrictedpython.readthedocs.io/
  Source, https://github.com/zopefoundation/RestrictedPython
  Tracker, https://github.com/zopefoundation/RestrictedPython/issues
"
SRC_URI="https://github.com/zopefoundation/${MY_PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${MY_PV}

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

DOCS="README.rst"

REQUIRES_DIST="
	Sphinx; extra == 'docs'
	furo; extra == 'docs'
	pytest-mock; extra == 'test'
	pytest; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/RestrictedPython"

PYTHON_MODULES="${PN}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
