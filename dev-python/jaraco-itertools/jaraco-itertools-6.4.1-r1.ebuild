# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.itertools"
inherit distutils-r1 pypi

DESCRIPTION="jaraco.itertools"
HOMEPAGE="
  https://pypi.org/project/jaraco-itertools/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo ; extra == 'docs'
	inflect
	jaraco.packaging (>=9.3) ; extra == 'docs'
	more-itertools (>=4.0.0)
	pytest (>=6) ; extra == 'testing'
	pytest-black (>=0.3.7) ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pytest-checkdocs (>=2.4) ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-enabler (>=2.2) ; extra == 'testing'
	pytest-mypy (>=0.9.1) ; (platform_python_implementation != 'PyPy') and extra == 'testing'
	pytest-ruff ; extra == 'testing'
	rst.linker (>=1.9) ; extra == 'docs'
	sphinx (>=3.5) ; extra == 'docs'
	sphinx-lint ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/inflect[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	>=dev-python/more-itertools-4.0.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/inflect[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-4.0.0[${PYTHON_USEDEP}]
"
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
	>=dev-python/setuptools-scm-1.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
