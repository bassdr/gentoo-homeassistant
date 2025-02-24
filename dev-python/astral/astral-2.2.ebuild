# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Calculations for the position of the sun and moon."
HOMEPAGE="
  https://pypi.org/project/astral/
  Documentation, https://astral.readthedocs.io/en/stable/index.html
  Source, https://github.com/sffjunkie/astral
  Issues, https://github.com/sffjunkie/astral/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	dataclasses ; python_version == '3.6'
	pytz
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pytz[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pytz[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
