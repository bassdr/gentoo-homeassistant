# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-plus/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage>=7.0.0; extra == 'test'
	pytest-html; extra == 'test'
	pytest>=7.4.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-html[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-7.0.5[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
