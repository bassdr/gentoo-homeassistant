# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="SSH2 protocol library"
HOMEPAGE="
  https://pypi.org/project/paramiko/
  Docs, https://docs.paramiko.org
  Source, https://github.com/paramiko/paramiko
  Issues, https://github.com/paramiko/paramiko/issues
  Changelog, https://www.paramiko.org/changelog.html
  CI, https://app.circleci.com/pipelines/github/paramiko/paramiko
"
SRC_URI="
	https://github.com/paramiko/paramiko/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all gssapi invoke"
IUSE="${GENERATED_IUSE} examples server"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/bcrypt-3.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/invoke-2.0[${PYTHON_USEDEP}] )
	invoke? ( >=dev-python/invoke-2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}] )
	gssapi? ( >=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}] )
	>=dev-python/pynacl-1.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# upstream doesn't really maintain the gssapi support
	tests/test_gssapi.py
	tests/test_kex_gss.py
	tests/test_ssh_gss.py
)

src_prepare() {
	local PATCHES=(
		"${FILESDIR}/${PN}-3.2.0-nih-test-deps.patch"
	)

	if ! use server; then
		PATCHES+=( "${FILESDIR}/${PN}-3.2.0-disable-server.patch" )
	fi
	distutils-r1_src_prepare
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p rerunfailures --reruns=5
}

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		docinto examples
		dodoc -r demos/*
	fi
}
