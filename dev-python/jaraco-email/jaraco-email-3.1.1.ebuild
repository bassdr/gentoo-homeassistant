# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.email"
inherit distutils-r1 pypi

DESCRIPTION="E-mail facilities by jaraco"
HOMEPAGE="
  https://pypi.org/project/jaraco-email/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiosmtpd
	furo ; extra == 'docs'
	jaraco.collections
	jaraco.packaging >=9.3 ; extra == 'docs'
	jaraco.text >=1.3
	keyring
	pytest >=6 ; extra == 'testing'
	pytest-black >=0.3.7 ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pytest-checkdocs >=2.4 ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-enabler >=2.2 ; extra == 'testing'
	pytest-mypy >=0.9.1 ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pytest-ruff ; extra == 'testing'
	rst.linker >=1.9 ; extra == 'docs'
	sphinx <7.2.5 ; extra == 'docs'
	sphinx >=3.5 ; extra == 'docs'
	sphinx-lint ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiosmtpd[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-text-1.3[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-7.2.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jaraco-text-1.3[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
		dev-python/pytest-ruff[${PYTHON_USEDEP}]
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
