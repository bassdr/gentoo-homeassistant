# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="PEP 621 metadata parsing"
HOMEPAGE="
  https://pypi.org/project/pyproject-metadata/
  changelog, https://pep621.readthedocs.io/en/stable/changelog.html
  homepage, https://github.com/pypa/pyproject-metadata
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( >=dev-python/furo-2023.9.10[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/packaging-19.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-7.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-1.10.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/packaging-19[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/exceptiongroup[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.4[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2[toml,${PYTHON_USEDEP}]
	>=dev-python/tomli-1.0.0[${PYTHON_USEDEP}]
)"
