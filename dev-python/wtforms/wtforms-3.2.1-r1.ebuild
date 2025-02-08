# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/wtforms/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="email"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	email-validator; extra == "email"
	markupsafe
"
GENERATED_RDEPEND="${RDEPEND}
	email? ( dev-python/email-validator[${PYTHON_USEDEP}] )
	dev-python/markupsafe[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/markupsafe[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/babel[${PYTHON_USEDEP}]
	test? (
		dev-python/email-validator[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/webob[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
