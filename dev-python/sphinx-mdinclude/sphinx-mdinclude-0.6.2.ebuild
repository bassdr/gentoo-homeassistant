# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-mdinclude/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/docutils-1.0[${PYTHON_USEDEP}]
	<dev-python/mistune-4.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.8[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/docutils-1.0[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	<dev-python/mistune-4.0[${PYTHON_USEDEP}]
	>=dev-python/mistune-3.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.8[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/attribution-1.7.1[${PYTHON_USEDEP}]
		=dev-python/black-24.4.2[${PYTHON_USEDEP}]
		=dev-python/coverage-7.5.1[${PYTHON_USEDEP}]
		=dev-python/docutils-0.20.1[${PYTHON_USEDEP}]
		=dev-python/docutils-0.21.2[${PYTHON_USEDEP}]
		=dev-python/flake8-7.0.0[${PYTHON_USEDEP}]
		=dev-python/flit-3.9.0[${PYTHON_USEDEP}]
		=dev-python/mistune-3.0.2[${PYTHON_USEDEP}]
		=dev-python/mypy-1.10.0[${PYTHON_USEDEP}]
		=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}]
		=dev-python/sphinx-7.3.7[${PYTHON_USEDEP}]
		=dev-python/ufmt-2.5.1[${PYTHON_USEDEP}]
		=dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
