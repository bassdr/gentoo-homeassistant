# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-metadata/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black>=22.1.0; extra == 'test'
	flake8>=4.0.1; extra == 'test'
	pre-commit>=2.17.0; extra == 'test'
	pytest>=7.0.0
	tox>=3.24.5; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-22.1.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		>=dev-python/tox-3.24.5[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.17.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/hatch-vcs-0.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
