# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Correctly generate plurals, singular nouns, ordinals, indefinite articles"
HOMEPAGE="
  https://pypi.org/project/inflect/
  Source, https://github.com/jaraco/inflect
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="check cover doc enabler test type"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo; extra == 'doc'
	jaraco.packaging>=9.3; extra == 'doc'
	jaraco.tidelift>=1.4; extra == 'doc'
	more-itertools>=8.5.0
	pygments; extra == 'test'
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'check'
	pytest-cov; extra == 'cover'
	pytest-enabler>=2.2; extra == 'enabler'
	pytest-mypy; extra == 'type'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'check'
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
	typeguard>=4.0.1
	typing-extensions; python_version < '3.9'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	>=dev-python/more-itertools-8.5.0[${PYTHON_USEDEP}]
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	>=dev-python/typeguard-4.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/typeguard-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.5.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-3.4.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
