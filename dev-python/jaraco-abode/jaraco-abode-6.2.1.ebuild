# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library interfacing to the Abode home security system"
HOMEPAGE="
  https://pypi.org/project/jaraco-abode/
  Source, https://github.com/jaraco/jaraco.abode
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="check cover doc enabler test type"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	bx-py-utils
	colorlog>=3.0.1
	furo; extra == 'doc'
	importlib-resources>=5.10
	jaraco.classes
	jaraco.collections
	jaraco.collections>=4.1; extra == 'test'
	jaraco.context
	jaraco.functools>=3.6
	jaraco.itertools
	jaraco.net>=9
	jaraco.packaging>=9.3; extra == 'doc'
	keyring
	lomond>=0.3.3
	more-itertools
	platformdirs
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'check'
	pytest-cov; extra == 'cover'
	pytest-enabler>=2.2; extra == 'enabler'
	pytest-mypy; extra == 'type'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'check'
	requests-mock; extra == 'test'
	requests-toolbelt
	requests>=2.12.4
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
	types-requests; extra == 'type'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/bx-py-utils[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.0.1[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/importlib-resources-5.10[${PYTHON_USEDEP}]
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.6[${PYTHON_USEDEP}]
	dev-python/jaraco-itertools[${PYTHON_USEDEP}]
	>=dev-python/jaraco-net-9[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/keyring[${PYTHON_USEDEP}]
	>=dev-python/lomond-0.3.3[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.12.4[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	type? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.12.4[${PYTHON_USEDEP}]
	>=dev-python/lomond-0.3.3[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.0.1[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	>=dev-python/jaraco-net-9[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/bx-py-utils[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/jaraco-itertools[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/jaraco-collections-4.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
