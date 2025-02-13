# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="license-expression is a comprehensive utility library to parse, compare, simplify and normalize license expressions (such as SPDX license expressions) using boolean logic."
HOMEPAGE="
  https://pypi.org/project/license-expression/
"
SRC_URI="
	https://github.com/aboutcode-org/license-expression/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/boolean-py-4.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/doc8-0.11.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-dark-mode-1.3.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0.4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/boolean-py-4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/isort[${PYTHON_USEDEP}]
	!=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-xdist-2[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
)"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
