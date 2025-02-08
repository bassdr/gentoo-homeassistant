# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hvac/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="parser"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	pyhcl<0.5.0,>=0.4.4; extra == "parser"
	requests<3.0.0,>=2.27.1
"
GENERATED_RDEPEND="${RDEPEND}
	parser? ( >=dev-python/pyhcl-0.4.4[${PYTHON_USEDEP}] <dev-python/pyhcl-0.5.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.27.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyhcl-0.4.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
		dev-python/jwcrypto[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/semantic-version[${PYTHON_USEDEP}]
		dev-python/werkzeug[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# ldap_test is not packaged.
	tests/integration_tests/api/auth_methods/test_ldap.py
	# https://github.com/lepture/authlib is not packaged.
	tests/integration_tests/api/auth_methods/test_oidc.py
)
