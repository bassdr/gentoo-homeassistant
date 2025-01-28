# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lazy-loader/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev lint test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( ~dev-python/changelist-0.5[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	test? ( >=dev-python/pytest-7.4[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}] )
	lint? ( ~dev-vcs/pre-commit-3.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
