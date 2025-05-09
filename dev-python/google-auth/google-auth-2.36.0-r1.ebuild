# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Google Authentication Library"
HOMEPAGE="
  https://pypi.org/project/google-auth/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="aiohttp enterprise-cert pyopenssl reauth requests"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiohttp<4.0.0.dev0,>=3.6.2; extra == 'aiohttp'
	cachetools<6.0,>=2.0.0
	cryptography; extra == 'enterprise-cert'
	cryptography>=38.0.3; extra == 'pyopenssl'
	pyasn1-modules>=0.2.1
	pyopenssl; extra == 'enterprise-cert'
	pyopenssl>=20.0.0; extra == 'pyopenssl'
	pyu2f>=0.1.5; extra == 'reauth'
	requests<3.0.0.dev0,>=2.20.0; extra == 'aiohttp'
	requests<3.0.0.dev0,>=2.20.0; extra == 'requests'
	rsa<5,>=3.1.4
"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( >=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0_pre0[${PYTHON_USEDEP}] )
	>=dev-python/cachetools-2.0.0[${PYTHON_USEDEP}] <dev-python/cachetools-6.0[${PYTHON_USEDEP}]
	enterprise-cert? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	pyopenssl? ( >=dev-python/cryptography-38.0.3[${PYTHON_USEDEP}] )
	>=dev-python/pyasn1-modules-0.2.1[${PYTHON_USEDEP}]
	enterprise-cert? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	pyopenssl? ( >=dev-python/pyopenssl-20.0.0[${PYTHON_USEDEP}] )
	reauth? ( >=dev-python/pyu2f-0.1.5[${PYTHON_USEDEP}] )
	aiohttp? ( >=dev-python/requests-2.20.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0_pre0[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/requests-2.20.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0_pre0[${PYTHON_USEDEP}] )
	>=dev-python/rsa-3.1.4[${PYTHON_USEDEP}] <dev-python/rsa-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/cachetools-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/rsa-3.1.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/moto[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
		dev-python/pyu2f[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		# these are compatibility tests with oauth2client
		# disable them to unblock removal of that package
		tests/test__oauth2client.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}
