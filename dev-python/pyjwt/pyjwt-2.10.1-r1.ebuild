# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="JSON Web Token implementation in Python"
HOMEPAGE="
  https://pypi.org/project/pyjwt/
  Homepage, https://github.com/jpadilla/pyjwt
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="crypto docs"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	crypto? ( >=dev-python/cryptography-3.4.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/zope-interface[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/python-jwt
"
BDEPEND="
	test? (
		>=dev-python/cryptography-3.4.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/coverage-5.0.4[toml,${PYTHON_USEDEP}]
		>=dev-python/cryptography-3.4.0[${PYTHON_USEDEP}]
		<dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/zope-interface[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# Internet
	tests/test_jwks_client.py::TestPyJWKClient::test_get_jwt_set_sslcontext_default
)

pkg_postinst() {
	optfeature "cryptography" dev-python/cryptography
}
