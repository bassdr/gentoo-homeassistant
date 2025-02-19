# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ansi2html/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	importlib-metadata; python_version < '3.8'
	mkdocs-material-extensions; extra == 'docs'
	mkdocs-material; extra == 'docs'
	mkdocs; extra == 'docs'
	mkdocstrings-python; extra == 'docs'
	mkdocstrings; extra == 'docs'
	pymdown-extensions; extra == 'docs'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	typing-extensions; python_version < '3.8'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material-extensions[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings-python[${PYTHON_USEDEP}] )
	docs? ( dev-python/pymdown-extensions[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
