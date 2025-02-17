# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="One-time password generator"
HOMEPAGE="
  https://pypi.org/project/oathtool/
  Source, https://github.com/jaraco/oathtool
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="check cover doc enabler type"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	autocommand
	furo; extra == 'doc'
	importlib-resources; extra == 'type'
	importlib-resources; python_version < '3.9'
	jaraco.packaging>=9.3; extra == 'doc'
	path
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'check'
	pytest-cov; extra == 'cover'
	pytest-enabler>=2.2; extra == 'enabler'
	pytest-mypy; extra == 'type'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'check'
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/autocommand[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	type? ( dev-python/importlib-resources[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/path[${PYTHON_USEDEP}]
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
