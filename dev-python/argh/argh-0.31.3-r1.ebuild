# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/argh/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="completion docs linters test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	completion? ( >=dev-python/argcomplete-2.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-7.4[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/readthedocs-sphinx-search-0.3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-pyproject-0.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/tox-4.11.3[${PYTHON_USEDEP}] )
	linters? ( >=dev-vcs/pre-commit-3.4.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/iocapture[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
