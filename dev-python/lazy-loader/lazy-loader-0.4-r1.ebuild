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

GENERATED_IUSE="lint"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	changelist==0.5; extra == 'dev'
	importlib-metadata; python_version < '3.8'
	packaging
	pre-commit==3.7.0; extra == 'lint'
	pytest-cov>=4.1; extra == 'test'
	pytest>=7.4; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	lint? ( ~dev-vcs/pre-commit-3.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/changelist-0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
