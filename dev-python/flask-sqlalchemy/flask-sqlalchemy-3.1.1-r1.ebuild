# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-sqlalchemy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flask>=2.2.5
	sqlalchemy>=2.0.16
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/flask-2.2.5[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.16[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/flask-2.2.5[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.16[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/blinker[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinx-issues \
	dev-python/sphinxcontrib-log-cabinet
