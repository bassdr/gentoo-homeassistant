# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python package for creating a client that talks with SIA-based alarm systems."
HOMEPAGE="
  https://pypi.org/project/pysiaalarm/
  Documentation, https://github.com/eavanvalkenburg/pysiaalarm
  Source, https://github.com/eavanvalkenburg/pysiaalarm
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="testing typing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	typing? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	testing? ( dev-python/pydocstyle[${PYTHON_USEDEP}] )
	testing? ( dev-python/pylint[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cases[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev-python/pytz[${PYTHON_USEDEP}]
	testing? ( dev-python/tox[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-pytz[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pycryptodome-3.9.7[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
