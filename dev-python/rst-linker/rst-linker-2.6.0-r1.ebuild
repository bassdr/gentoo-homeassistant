# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rst-linker/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo; extra == 'docs'
	jaraco.context
	jaraco.packaging>=9.3; extra == 'docs'
	jaraco.vcs>=2.1
	path; extra == 'testing'
	pytest-checkdocs>=2.4; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-enabler>=2.2; extra == 'testing'
	pytest-mypy; platform_python_implementation != 'PyPy' and extra == 'testing'
	pytest-ruff>=0.2.1; extra == 'testing'
	pytest-subprocess; extra == 'testing'
	pytest>=6; extra == 'testing'
	rst.linker>=1.9; extra == 'docs'
	sphinx-lint; extra == 'docs'
	sphinx>=3.5; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	>=dev-python/jaraco-vcs-2.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	>=dev-python/jaraco-vcs-2.1[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/path[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
		dev-python/pytest-subprocess[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-3.4.1[${PYTHON_USEDEP}]
	test? (
		dev-python/path[${PYTHON_USEDEP}]
		dev-python/pytest-subprocess[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
