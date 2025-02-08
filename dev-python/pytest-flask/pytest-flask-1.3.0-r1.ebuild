# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-flask/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Flask
	Sphinx ; extra == 'docs'
	Werkzeug
	pytest >=5.2
	sphinx-rtd-theme ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.2[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	dev-python/werkzeug[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
