# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.envs"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco.envs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/path[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
	testing? ( dev-python/pytest-ruff[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-7.2.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tox[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/path[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# optional runtime dep, not used by anything in ::gentoo
	sed -i -e '/tox/d' setup.cfg || die
	distutils-r1_src_prepare
}

python_test() {
	epytest tests
}
