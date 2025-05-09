# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A simple interface to GPIO devices with Raspberry Pi."
HOMEPAGE="
  https://pypi.org/project/gpiozero/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	RPi.GPIO ; extra == 'test'
	colorzero
	coverage ; extra == 'test'
	mock ; extra == 'test'
	pigpio ; extra == 'test'
	pytest ; extra == 'test'
	sphinx ; extra == 'doc'
	sphinx-rtd-theme ; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/colorzero[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/colorzero[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pigpio[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/rpi-gpio[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
