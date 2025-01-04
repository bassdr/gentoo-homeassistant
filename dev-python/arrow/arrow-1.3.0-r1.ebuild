# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Better dates & times for Python"
HOMEPAGE="
  https://pypi.org/project/arrow/
  Documentation, https://arrow.readthedocs.io
  Issues, https://github.com/arrow-py/arrow/issues
  Source, https://github.com/arrow-py/arrow
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/types-python-dateutil[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/addopts/d' tox.ini || die
	# unnecessary type stub deps
	sed -i -e '/types-/d' pyproject.toml || die
	distutils-r1_src_prepare
}
