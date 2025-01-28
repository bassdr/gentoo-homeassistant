# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-plus/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( >=dev-python/coverage-7.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
	test? ( dev-python/pytest-html[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-7.0.5[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
