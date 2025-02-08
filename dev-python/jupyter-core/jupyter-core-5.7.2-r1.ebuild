# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-core/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	ipykernel; extra == 'test'
	myst-parser; extra == 'docs'
	platformdirs>=2.5
	pre-commit; extra == 'test'
	pydata-sphinx-theme; extra == 'docs'
	pytest-cov; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest<8; extra == 'test'
	pywin32>=300; sys_platform == 'win32' and platform_python_implementation != 'PyPy'
	sphinx-autodoc-typehints; extra == 'docs'
	sphinxcontrib-github-alt; extra == 'docs'
	sphinxcontrib-spelling; extra == 'docs'
	traitlets; extra == 'docs'
	traitlets>=5.3
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.5[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.3[${PYTHON_USEDEP}]
	docs? ( dev-python/traitlets[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/platformdirs-2.5[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.11.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pip[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/myst-parser \
	dev-python/pydata-sphinx-theme \
	dev-python/sphinx-autodoc-typehints \
	dev-python/sphinxcontrib-github-alt \
	dev-python/sphinxcontrib-spelling \
	dev-python/traitlets
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		<dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
