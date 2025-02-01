# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/passlib/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="argon2 bcrypt build_docs totp"
IUSE="${GENERATED_IUSE} doc test-rust"

GENERATED_DEPEND="${PYTHON_DEPS}
	argon2? ( >=dev-python/argon2-cffi-18.2.0[${PYTHON_USEDEP}] )
	bcrypt? ( >=dev-python/bcrypt-3.1.0[${PYTHON_USEDEP}] )
	build_docs? ( >=dev-python/cloud-sptheme-1.10.1[${PYTHON_USEDEP}] )
	totp? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	build_docs? ( >=dev-python/sphinx-1.6[${PYTHON_USEDEP}] )
	build_docs? ( >=dev-python/sphinxcontrib-fulltoc-1.2.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/scrypt[${PYTHON_USEDEP}]
		test-rust? (
			dev-python/bcrypt[${PYTHON_USEDEP}]
			dev-python/cryptography[${PYTHON_USEDEP}]
		)
	)"

distutils_enable_tests pytest

src_prepare() {
	# fix compatibility with >=dev-python/bcrypt-4.1
	# https://foss.heptapod.net/python-libs/passlib/-/issues/190
	sed -i -e '/bcrypt/s:__about__\.::' passlib/handlers/bcrypt.py || die

	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=(
		# broken all the time by new django releases
		passlib/tests/test_ext_django.py
	)

	case ${EPYTHON} in
		python3.13)
			EPYTEST_DESELECT+=(
				# crypt module has been removed, so the platform backend
				# does not work anymore
				passlib/tests/test_handlers.py::{des,md5,sha256,sha512}_crypt_os_crypt_test
			)
			;;
	esac

	# skip fuzzing tests, they are very slow
	epytest -k "not fuzz_input"
}

python_install_all() {
	distutils-r1_python_install_all
	use doc && dodoc docs/{*.rst,requirements.txt,lib/*.rst}
}

pkg_postinst() {
	optfeature "Argon2 support" dev-python/argon2-cffi
	optfeature "bcrypt support" dev-python/bcrypt
	optfeature "scrypt support" dev-python/scrypt
	optfeature "Time-based One-Time Password (TOTP) support" dev-python/cryptography
}
# RDEPEND could not be inserted in this ebuild
