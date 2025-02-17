# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The Microsoft Authentication Library (MSAL) for Python library enables your app to access the Microsoft Cloud by supporting authentication of users with Microsoft Azure Active Directory accounts (AAD) and Microsoft Accounts (MSA) using industry standard OAuth2 and OpenID Connect."
HOMEPAGE="
  https://pypi.org/project/msal/
  Changelog, https://github.com/AzureAD/microsoft-authentication-library-for-python/releases
  Documentation, https://msal-python.readthedocs.io/
  Questions, https://stackoverflow.com/questions/tagged/azure-ad-msal+python
  Feature/Bug Tracker, https://github.com/AzureAD/microsoft-authentication-library-for-python/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	PyJWT[crypto]<3,>=1.0.0
	cryptography<46,>=2.5
	pymsalruntime<0.18,>=0.14; (python_version >= '3.6' and platform_system == 'Windows') and extra == 'broker'
	pymsalruntime<0.18,>=0.17; (python_version >= '3.8' and platform_system == 'Darwin') and extra == 'broker'
	requests<3,>=2.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}] <dev-python/cryptography-46[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-1.0.0[crypto,${PYTHON_USEDEP}] <dev-python/pyjwt-3[crypto,${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
