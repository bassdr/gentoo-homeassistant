# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyspnego/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="kerberos yaml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cryptography
	gssapi>=1.6.0; sys_platform != "win32" and extra == "kerberos"
	krb5>=0.3.0; sys_platform != "win32" and extra == "kerberos"
	ruamel.yaml; extra == "yaml"
	sspilib>=0.1.0; sys_platform == "win32"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	kerberos? ( >=dev-python/gssapi-1.6.0[${PYTHON_USEDEP}] )
	kerberos? ( >=dev-python/krb5-0.3.0[${PYTHON_USEDEP}] )
	yaml? ( dev-python/ruamel-yaml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/gssapi[${PYTHON_USEDEP}]
		>=dev-python/krb5-0.3.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "Kerberos authentication" "dev-python/gssapi >=dev-python/krb5-0.3.0"
	optfeature "YAML output support" "dev-python/ruamel-yaml"
}
