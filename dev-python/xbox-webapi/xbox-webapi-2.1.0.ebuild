# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A library to authenticate with Windows Live/Xbox Live and use their API"
HOMEPAGE="
  https://pypi.org/project/xbox-webapi/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	appdirs
	bandit ==1.7.5 ; extra == 'dev'
	black ==23.11.0 ; extra == 'dev'
	bump2version ; extra == 'dev'
	coverage ; extra == 'dev'
	ecdsa
	httpx
	isort ==5.12.0 ; extra == 'dev'
	ms-cv
	pre-commit ==3.5.0 ; extra == 'dev'
	pydantic ==2.*
	pydocstyle ==6.1.1 ; extra == 'dev'
	pytest ; extra == 'dev'
	pytest-asyncio ; extra == 'dev'
	pytest-cov ; extra == 'dev'
	pytest-runner ; extra == 'dev'
	pyupgrade ==3.15.0 ; extra == 'dev'
	respx ; extra == 'dev'
	ruff ==0.1.6 ; extra == 'dev'
	sphinx-mdinclude ; extra == 'docs'
	sphinx-rtd-theme ; extra == 'docs'
	twine ; extra == 'dev'
	watchdog ; extra == 'dev'
	wheel ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/ms-cv[${PYTHON_USEDEP}]
	=dev-python/pydantic-2*[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-mdinclude[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/ms-cv[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/bandit-1.7.5[${PYTHON_USEDEP}]
		~dev-python/black-23.11.0[${PYTHON_USEDEP}]
		dev-python/bump2version[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		~dev-python/isort-5.12.0[${PYTHON_USEDEP}]
		~dev-python/pydocstyle-6.1.1[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		~dev-python/pyupgrade-3.15.0[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		~dev-python/ruff-0.1.6[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/watchdog[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-3.5.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
