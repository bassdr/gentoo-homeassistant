# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
HOMEPAGE="
  https://pypi.org/project/oauthlib/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# optional extras hard set as RDEPs. See setup.py
GENERATED_IUSE="rsa signals signedtoken"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	signals? ( >=dev-python/blinker-1.4.0[${PYTHON_USEDEP}] )
	rsa? ( >=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}] )
	signedtoken? ( >=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}] )
	signedtoken? ( <dev-python/pyjwt-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyjwt-1.0.0[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/oauthlib/oauthlib/commit/fe020db74199d5284c00d7735aa7d4ddc90f5d61
	"${FILESDIR}/${P}-py313.patch"
)

EPYTEST_DESELECT=(
	# exception mismatch
	# https://github.com/oauthlib/oauthlib/issues/877
	tests/oauth1/rfc5849/test_signatures.py::SignatureTests::test_rsa_bad_keys
)
