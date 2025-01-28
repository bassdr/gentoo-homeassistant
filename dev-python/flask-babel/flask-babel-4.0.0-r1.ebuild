# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/Flask-Babel/"
SRC_URI="
	https://github.com/python-babel/flask-babel/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/babel-2.12[${PYTHON_USEDEP}]
	>=dev-python/flask-2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/babel-2.12[${PYTHON_USEDEP}]
	>=dev-python/flask-2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.7[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes
distutils_enable_tests pytest
# PYPI_PN could not be inserted in this ebuild
