# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/securesystemslib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="awskms azurekms crypto gcpkms hsm pyspx sigstore vault"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	asn1crypto; extra == "hsm"
	azure-identity; extra == "azurekms"
	azure-keyvault-keys; extra == "azurekms"
	boto3; extra == "awskms"
	botocore; extra == "awskms"
	cryptography>=40.0.0; extra == "awskms"
	cryptography>=40.0.0; extra == "azurekms"
	cryptography>=40.0.0; extra == "crypto"
	cryptography>=40.0.0; extra == "gcpkms"
	cryptography>=40.0.0; extra == "hsm"
	cryptography>=40.0.0; extra == "vault"
	google-cloud-kms; extra == "gcpkms"
	hvac; extra == "vault"
	pykcs11; extra == "hsm"
	pyspx>=0.5.0; extra == "pyspx"
	sigstore~=3.0; extra == "sigstore"
"
GENERATED_RDEPEND="${RDEPEND}
	hsm? ( dev-python/asn1crypto[${PYTHON_USEDEP}] )
	azurekms? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
	azurekms? ( dev-python/azure-keyvault-keys[${PYTHON_USEDEP}] )
	awskms? ( dev-python/boto3[${PYTHON_USEDEP}] )
	awskms? ( dev-python/botocore[${PYTHON_USEDEP}] )
	awskms? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	azurekms? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	crypto? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	gcpkms? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	hsm? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	vault? ( >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}] )
	gcpkms? ( dev-python/google-cloud-kms[${PYTHON_USEDEP}] )
	vault? ( dev-python/hvac[${PYTHON_USEDEP}] )
	hsm? ( dev-python/pykcs11[${PYTHON_USEDEP}] )
	pyspx? ( >=dev-python/pyspx-0.5.0[${PYTHON_USEDEP}] )
	sigstore? ( >=dev-python/sigstore-3.0[${PYTHON_USEDEP}] =dev-python/sigstore-3*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# TODO: unbundle https://github.com/pyca/ed25519 (wtf? not on PyPI?)

python_test() {
	local EPYTEST_DESELECT=(
		# requires pyspx
		tests/test_signer.py::TestSphincs::test_sphincs
	)
	local EPYTEST_IGNORE=(
		# requires PyKCS11
		tests/test_hsm_signer.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests
}
