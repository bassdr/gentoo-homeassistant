# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asyncio Python API for KEF speakers."
HOMEPAGE="
  https://pypi.org/project/aiokef/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-timeout
	m2r2 ; extra == 'docs'
	pre-commit ; extra == 'dev'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	pytest-mypy ; extra == 'test'
	sphinx ; extra == 'docs'
	sphinx-rtd-theme ; extra == 'docs'
	sphinxcontrib.apidoc ; extra == 'docs'
	tenacity
	tox ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	docs? ( dev-python/m2r2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-apidoc[${PYTHON_USEDEP}] )
	dev-python/tenacity[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
