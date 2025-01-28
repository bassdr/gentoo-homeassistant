# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-jupyter/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="client docs server test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	client? ( >=dev-python/ipykernel-6.14[${PYTHON_USEDEP}] )
	server? ( >=dev-python/ipykernel-6.14[${PYTHON_USEDEP}] )
	client? ( >=dev-python/jupyter-client-7.4.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/jupyter-client-7.4.0[${PYTHON_USEDEP}] )
	>=dev-python/jupyter-core-5.7[${PYTHON_USEDEP}]
	server? ( >=dev-python/jupyter-server-1.21[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	client? ( >=dev-python/nbformat-5.3[${PYTHON_USEDEP}] )
	server? ( >=dev-python/nbformat-5.3[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
	test? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/ipykernel-6.14[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7.4.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-5.7[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-1.21[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-7[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
