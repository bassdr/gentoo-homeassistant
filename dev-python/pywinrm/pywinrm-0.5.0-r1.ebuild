# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pywinrm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="credssp"
IUSE="${GENERATED_IUSE} kerberos"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
	credssp? ( >=dev-python/requests-credssp-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-ntlm-1.1.0[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
	>=dev-python/requests-ntlm-1.1.0[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	kerberos? (
		<dev-python/kerberos-2.0.0[${PYTHON_USEDEP}]
		dev-python/requests-credssp[${PYTHON_USEDEP}]
		dev-python/requests-kerberos[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# unbundle requests-kerberos
	rm -r winrm/vendor || die
	sed -i -e 's:winrm\.vendor\.::' winrm/*.py || die
}
